//
//  DismissKeyboardModifier.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation
import SwiftUI

struct DismissKeyboardModifier: ViewModifier {
    var dargGesture = DragGesture().onChanged { _ in
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var tapGesture = TapGesture().onEnded { _ in
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func body(content: Content) -> some View {
        content
            .gesture(dargGesture)
            .gesture(tapGesture)
    }
}
extension View {
    func dismissKeyboard() -> some View {
        return modifier(DismissKeyboardModifier())
    }
}
