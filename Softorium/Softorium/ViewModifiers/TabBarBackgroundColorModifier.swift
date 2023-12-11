//
//  TabBarBackgroundColorModifier.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation
import SwiftUI

struct TabBarBackgroundColorModifier: ViewModifier {
    var color: Color

    init(color: Color) {
        self.color = color
    }

    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITabBar.appearance().backgroundColor = UIColor(color)
                UITabBar.appearance().barTintColor = UIColor(color)
            }
    }
}

extension View {
    func tabBarBackgroundColor(color: Color) -> some View {
        modifier(TabBarBackgroundColorModifier(color: color))
    }
}
