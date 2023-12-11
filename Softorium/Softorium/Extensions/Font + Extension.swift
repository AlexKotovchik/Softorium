//
//  Font + Extension.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import Foundation
import SwiftUI

extension Font {
    enum Inter {
        case regular
        case bold
        case semibold
        
        var value: String {
            switch self {
            case .semibold:
                "Inter-SemiBold"
            case .bold:
                "Inter-Bold"
            case .regular:
                "Inter-Regular"
            }
        }
    }
    
   
    
    static func inter(_ type: Inter, size: CGFloat) -> Font {
        .custom(type.value, size: size)
    }
}
