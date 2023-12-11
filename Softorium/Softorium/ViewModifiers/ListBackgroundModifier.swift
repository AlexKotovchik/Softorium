//
//  ListBackgroundModifier.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation
import SwiftUI

struct ListBackgroundModifier: ViewModifier {
    var color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView.appearance().backgroundColor = UIColor(color)
            }
    }
}

extension View {
    func listBackground(color: Color) -> some View {
        modifier(ListBackgroundModifier(color: color))
    }
}

