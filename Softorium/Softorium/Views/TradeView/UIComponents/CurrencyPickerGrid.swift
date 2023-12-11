//
//  CurrencyPickerGrid.swift
//  Softorium
//
//  Created by AlexKotov on 10.12.23.
//

import SwiftUI

struct CurrencyPickerGrid: View {
    @Binding var selectedCurrency: CurrencyPair
    var items: [CurrencyPair]
    
    var body: some View {
        ZStack {
            Color.tradeBackground
                .ignoresSafeArea(.all)
            ScrollView {
                ZStack {
                    Text("Currency pair")
                        .font(.inter(.bold, size: 22))
                        .foregroundColor(.white)
                    HStack {
                        BackButton()
                            .padding(.leading, 24)
                        Spacer()
                    }
                }
                .padding(.top, 24)
                
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 18), GridItem(.flexible())], spacing: 18) {
                    ForEach(items, id: \.self) { item in
                        Text(item.name)
                            .padding(10)
                            .frame(height: 54)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 12)
                                .fill(selectedCurrency == item ? .selectedItemBackground : Color.slotBackground))
                            .font(.inter(.semibold, size: 14))
                            .foregroundColor(.white)
                            .onTapGesture {
                                selectedCurrency = item
                            }
                    }
                }
                .padding(.top, 32)
                .padding(.horizontal, 24)
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    CurrencyPickerGrid(selectedCurrency: .constant(CurrencyPair.currencyPairs[0]), items: CurrencyPair.currencyPairs)
}

