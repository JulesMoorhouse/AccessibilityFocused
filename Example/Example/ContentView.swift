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

    @State private var text1 = ""
    @State private var text2 = ""

    var body: some View {
        VStack(alignment: .center) {
            Text("Remember accessibility focus only works on a physical devices with voice over turned on")
                .multilineTextAlignment(.center)
            
            TextField("Text 1", text: $text1)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibilityFocused(
                    $accessibilityFocus1,
                    identifier:
                    AccessibilityIdentifiers
                        .firstField
                        .focusIdentity()
                )

            TextField("Text 2", text: $text2)
                .foregroundColor(Color.secondary)
                .padding()
                .accessibilityFocused(
                    $accessibilityFocus2,
                    identifier:
                    AccessibilityIdentifiers
                        .secondField
                        .focusIdentity()
                )

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
        }
        .padding(24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
