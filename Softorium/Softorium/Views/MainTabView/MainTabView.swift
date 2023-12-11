//
//  MainTabView.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import Foundation
import SwiftUI

struct MainTabView: View {

    var body: some View {
        TabView {
            TradeView()
                .tabItem {
                    VStack {
                        Image("trade")
                            .renderingMode(.template)
                        Text("Trade")
                    }
                }
            TopTradersView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                            .renderingMode(.template)
                        Text("Top")
                    }
                }
        }
        .tabBarBackgroundColor(color: .tabBarBackgound)
        .accentColor(.selectedItemBackground)
    }
}

#Preview {
    MainTabView()
}
