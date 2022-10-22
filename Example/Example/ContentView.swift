//
//  ContentView.swift
//  Example
//
//  Created by Jules Moorhouse
//

import AccessibilityFocused
import SwiftUI

struct ContentView: View {
    @State private var accessibilityFocus1: Bool = false
    @State private var accessibilityFocus2: Bool = false
    @State private var accessibilityFocus3: Bool = false
    @State private var accessibilityFocus4: Bool = false

    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var text4 = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("Remember accessibility focus only works on physical devices with voice over turned on")
                .multilineTextAlignment(.center)

            TextField("Text 1", text: $text1)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibilityFocused(state: $accessibilityFocus1)

            TextField("Text 2", text: $text2)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibilityFocused(state: $accessibilityFocus2)

            HStack {
                Button(
                    "Set field 1",
                    action: {
                        accessibilityFocus1.toggle()
                    }
                )

                Spacer()

                Button(
                    "Set field 2",
                    action: {
                        accessibilityFocus2.toggle()
                    }
                )
            }

            Divider()
                .padding(24)

            Text("UI Testable - Accessibility Focus")

            TextField("Text 3", text: $text3)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibility(addTraits: .isStaticText)
                .accessibilityFocused(
                    $accessibilityFocus3,
                    identifier:
                    AccessibilityIdentifiers
                        .thirdField
                        .focusIdentity()
                )

            TextField("Text 4", text: $text4)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibility(addTraits: .isStaticText)
                .accessibilityFocused(
                    $accessibilityFocus4,
                    identifier:
                    AccessibilityIdentifiers
                        .fourthField
                        .focusIdentity()
                )

            HStack {
                Button(
                    "Set field 3",
                    action: {
                        accessibilityFocus3.toggle()
                    }
                )
                .accessibility(
                    identifier: AccessibilityIdentifiers.thirdSetFieldButton.automatedId()
                )

                Spacer()

                Button(
                    "Set field 4",
                    action: {
                        accessibilityFocus4.toggle()
                    }
                )
                .accessibility(
                    identifier: AccessibilityIdentifiers.fourthSetFieldButton.automatedId()
                )
            }
            
            Spacer()
        }
        .padding(24)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
