//
//  Color + Extension.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
            let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
            var int: UInt64 = 0
            Scanner(string: hex).scanHexInt64(&int)
            let a, r, g, b: UInt64
            switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
            }

            self.init(
                .sRGB,
                red: Double(r) / 255,
                green: Double(g) / 255,
                blue:  Double(b) / 255,
                opacity: Double(a) / 255
            )
        }
    
    static var preloaderBackground = Color(hex: "#5B5A60")
    static var preloaderForeground = Color(hex: "#35B972")
    static var topTradersBackground = Color(hex: "#1C1F2D")
    static var listHeaderForeground = Color(hex: "#C1C2C8")
    static var listCellBackground = Color(hex: "#2E303E")
    static var tradeBalanceForeground = Color(hex: "#C8C8C8")
    static var slotBackground = Color(hex: "#333749")
    static var selectedItemBackground = Color(hex: "#35B972")
    static var tradeBackground = Color(hex: "#121629")
    static var tabBarBackgound = Color(hex: "#2E3241")
    static var sellButtonBackground = Color(hex: "#FE3D43")
}
