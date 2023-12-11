//
//  TradeViewModel.swift
//  Softorium
//
//  Created by AlexKotov on 10.12.23.
//

import Foundation

class TradeViewModel: ObservableObject {
    @Published var currencyPairs: [CurrencyPair] = []
    @Published var selectedCurrencyPair: CurrencyPair
    @Published var timerText: String = "00:00"
    @Published var investmentText: String = "1000"
    @Published var investmentFieldFocused: Bool = false
    @Published var timerFieldFocused: Bool = false
    
    init() {
        currencyPairs = CurrencyPair.currencyPairs
        selectedCurrencyPair = CurrencyPair.currencyPairs[0]
    }
    
    func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()
        let limitedString = String(numericString.prefix(4))
        let formattedString: String
        
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }
        
        return formattedString
    }
}
