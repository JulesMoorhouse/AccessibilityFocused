//
//  AccessibilityFocusSetterModifier.swift
//  AccessibilityFocused
//
//  Created by Jules Moorhouse
//

import Combine
import SwiftUI

@available(tvOS, unavailable) @available(macOS, unavailable) @available(iOS 14, *)
struct AccessibilityFocusSetterModifier: ViewModifier {
    @Binding var focused: Bool
    @State private var height: CGFloat = .zero
    @State private var accessibilityIdentifier: String = ""

    private let identifier: FocusIdentity
    private static var currentFocusIdentifier = ""

    init(
        _ state: Binding<Bool>,
        identifier: FocusIdentity
    ) {
        _focused = state
        self.identifier = identifier
        _accessibilityIdentifier = State(wrappedValue: identifier.accessibilityId)
    }

    func body(content: Content) -> some View {
        WrapperView(
            focused: $focused,
            dynamicHeight: $height,
            identifier: identifier,
            content: content
                .accessibility(identifier: accessibilityIdentifier)
        )
        .onChange(of: focused) { _ in
            if focused == true {
                #if targetEnvironment(simulator)
                    accessibilityIdentifier = identifier.uiTestFocusId

                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        accessibilityIdentifier = identifier.accessibilityId
                    }
                #endif
            }
        }
        .onChange(of: AccessibilityFocusSetterModifier.currentFocusIdentifier) { value in
            if value != identifier.accessibilityId {
                focused = false
            }
        }
        .frame(minHeight: height)
        .fixedSize(horizontal: false, vertical: true)
    }

    private struct WrapperView<Content: View>: UIViewRepresentable {
        @Binding var focused: Bool
        @Binding var dynamicHeight: CGFloat

        private let identifier: FocusIdentity
        private let content: Content

        init(
            focused: Binding<Bool>,
            dynamicHeight: Binding<CGFloat>,
            identifier: FocusIdentity,
            content: Content
        ) {
            _dynamicHeight = dynamicHeight
            _focused = focused
            self.identifier = identifier
            self.content = content
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        // swiftlint:disable nesting
        class Coordinator: NSObject {
            let parent: WrapperView
            var hostingController: UIHostingController<Content>!

            init(_ parent: WrapperView) {
                self.parent = parent
            }
        }

        func makeUIView(context: Context) -> UIView {
            let child = UIHostingController(rootView: content)
            child.view.translatesAutoresizingMaskIntoConstraints = false
            child.view.backgroundColor = .clear
            context.coordinator.hostingController = child
            return child.view
        }

        func updateUIView(_ uiView: UIView, context: Context) {
            context.coordinator.hostingController.rootView = content

            DispatchQueue.main.async {
                dynamicHeight = uiView.sizeThatFits(
                    CGSize(
                        width: uiView.bounds.width,
                        height: CGFloat.greatestFiniteMagnitude
                    )
                ).height
            }

            if focused {
                DispatchQueue.main.async {
                    UIAccessibility.post(
                        notification: UIAccessibility.Notification.layoutChanged,
                        argument: uiView
                    )

                    AccessibilityFocusSetterModifier.currentFocusIdentifier = identifier.accessibilityId
                    focused = false
                }
            }
        }
    }
}
