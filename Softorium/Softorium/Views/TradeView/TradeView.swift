//
//  TradeView.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import SwiftUI
import WebKit
import Combine

struct TradeView: View {
    @StateObject var vm: TradeViewModel = TradeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.tradeBackground
                    .ignoresSafeArea(.all)
                VStack {
                    Text("Trade")
                        .font(.inter(.bold, size: 22))
                        .foregroundColor(.white)
                        .padding(.top, 24)
                    VStack(spacing: 4) {
                        Text("Balance")
                            .font(.inter(.regular, size: 12))
                            .foregroundColor(.tradeBalanceForeground)
                        Text("10 000")
                            .font(.inter(.bold, size: 16))
                            .foregroundColor(.white)
                    }
                    .frame(height: 54)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(Color.slotBackground))
                    .padding(.horizontal, 24)
                    
                    WebView(urlString: vm.selectedCurrencyPair.url, targetClass: "chart-markup-table pane")
                        .padding(.horizontal, 24)
                    
                    Spacer()
                    NavigationLink(destination: CurrencyPickerGrid(selectedCurrency: $vm.selectedCurrencyPair, items: vm.currencyPairs)) {
                        ZStack {
                            Text(vm.selectedCurrencyPair.name)
                                .font(.inter(.bold, size: 16))
                                .foregroundColor(.white)
                            HStack {
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.inter(.regular, size: 24))
                                    .foregroundColor(.white)
                                    .padding(.trailing, 8)
                            }
                        }
                        .padding(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color.slotBackground))
                        .padding(.horizontal, 24)
                    }
                    
                    HStack {
                        VStack {
                            Text("Timer")
                                .font(.inter(.regular, size: 12))
                                .foregroundColor(.tradeBalanceForeground)
                                .padding(.bottom, 4)
                            HStack() {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "minus.circle")
                                        .font(.inter(.regular, size: 14))
                                        .foregroundColor(.tradeBalanceForeground)
                                }
                                
                                TextField("", text: $vm.timerText, onEditingChanged: { (editingChanged) in
                                    if editingChanged {
                                        vm.timerFieldFocused = true
                                    } else {
                                        vm.timerFieldFocused = false
                                    }
                                })
                                .keyboardType(.decimalPad)
                                .font(.inter(.semibold, size: 16))
                                .frame(width: 64)
                                .background(Color.clear)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .fixedSize()
                                .onChange(of: vm.timerText) { newValue in
                                    vm.timerText = vm.formatTimeInput(newValue)
                                }
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .font(.inter(.regular, size: 14))
                                        .foregroundColor(.tradeBalanceForeground)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color.slotBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(vm.timerFieldFocused ? Color.selectedItemBackground : .clear, lineWidth: 1)
                        )
                        .padding(.leading, 24)
                        
                        VStack {
                            Text("Investment")
                                .font(.inter(.regular, size: 12))
                                .foregroundColor(.tradeBalanceForeground)
                                .padding(.bottom, 4)
                            HStack {
                                Button {
                                    
                                } label: {
                                    Image(systemName: "minus.circle")
                                        .font(.inter(.regular, size: 14))
                                        .foregroundColor(.tradeBalanceForeground)
                                }
                                
                                TextField("", text: $vm.investmentText, onEditingChanged: { (editingChanged) in
                                    if editingChanged {
                                        vm.investmentFieldFocused = true
                                    } else {
                                        vm.investmentFieldFocused = false
                                    }
                                })
                                .keyboardType(.decimalPad)
                                .font(.inter(.semibold, size: 16))
                                .frame(width: 64)
                                .multilineTextAlignment(.center)
                                .background(Color.clear)
                                .foregroundColor(.white)
                                .fixedSize()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "plus.circle")
                                        .font(.inter(.regular, size: 14))
                                        .foregroundColor(.tradeBalanceForeground)
                                }
                            }
                        }
                        .padding(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color.slotBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(vm.investmentFieldFocused ? Color.selectedItemBackground : .clear, lineWidth: 1)
                        )
                        .padding(.trailing, 24)
                    }
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Sell")
                                .font(.inter(.semibold, size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                        .padding(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color.sellButtonBackground))
                        .padding(.leading, 24)
                        
                        Button {
                            
                        } label: {
                            Text("Buy")
                                .font(.inter(.semibold, size: 24))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                        .padding(10)
                        .frame(height: 54)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .fill(Color.selectedItemBackground))
                        .padding(.trailing, 24)
                    }
                }
                .padding(.bottom, 8)
            }
            .navigationBarHidden(true)
            .dismissKeyboard()
        }
    }
}

#Preview {
    TradeView()
}

