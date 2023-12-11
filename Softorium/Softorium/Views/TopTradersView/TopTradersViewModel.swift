//
//  TopTradersViewModel.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import Foundation

class TopTradersViewModel: ObservableObject {
    @Published var topTraders: [Trader] = [
        Trader(country: "🇫🇷", name: "Alex", deposit: 100, profit: 200),
        Trader(country: "🇨🇦", name: "Jack", deposit: 200, profit: 300),
        Trader(country: "🇺🇸", name: "Bob", deposit: 300, profit: 400),
        Trader(country: "🇬🇧", name: "Nick", deposit: 400, profit: 500),
        Trader(country: "🇯🇵", name: "Fiona", deposit: 500, profit: 600),
        Trader(country: "🇰🇷", name: "Joy", deposit: 600, profit: 700),
        Trader(country: "🇩🇪", name: "Mick", deposit: 700, profit: 800),
        Trader(country: "🇪🇸", name: "John", deposit: 800, profit: 900),
        Trader(country: "🇮🇹", name: "Paul", deposit: 900, profit: 980),
        Trader(country: "🇷🇺", name: "Victor", deposit: 950, profit: 990),
    ]
    
    init() {
        sortTraders()
    }
    
    func randomProfitChange() {
        let randomNumber = Int.random(in: 1...10)
        for _ in 1...randomNumber {
            guard var randomTrader = topTraders.randomElement() else { return }
            guard let randomTraderIndex = topTraders.firstIndex(of: randomTrader) else { return }
            randomTrader.profit += Int.random(in: -150...50)
            topTraders.remove(at: randomTraderIndex)
            topTraders.append(randomTrader)
        }
        sortTraders()
    }
    
    func sortTraders() {
        topTraders.sort { $0.profit > $1.profit }
    }
}
