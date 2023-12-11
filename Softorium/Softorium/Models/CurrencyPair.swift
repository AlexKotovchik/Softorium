//
//  CurrencyPair.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation

struct CurrencyPair: Hashable {
    var id: UUID
    var name: String
    var url: String
    
    static var currencyPairs: [CurrencyPair] = [CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
                                                CurrencyPair(id: UUID(), name: "GPB/USD", url: "https://www.tradingview.com/chart/?symbol=NASDAQ%3AGBP"),
                                                CurrencyPair(id: UUID(), name: "EUR/USD", url: "https://www.tradingview.com/chart/?symbol=BMFBOVESPA%3AEUR1%21"),
    ]
}
