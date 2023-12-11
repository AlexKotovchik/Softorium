//
//  TopTradersView.swift
//  Softorium
//
//  Created by AlexKotov on 8.12.23.
//

import SwiftUI

struct TopTradersView: View {
    @StateObject var vm: TopTradersViewModel = TopTradersViewModel()
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.topTradersBackground
                .ignoresSafeArea(.all)
            VStack {
                Text("TOP 10 Traders")
                    .font(.inter(.bold, size: 22))
                    .foregroundColor(.white)
                    .padding(.top, 24)
                    List {
                        HStack {
                            Text("№").bold()
                                .frame(width: 25, alignment: .leading)
                            Text("Country").bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                            Text("Name").bold()
                                .frame(maxWidth: .infinity)
                            Text("Deposit").bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("Profit").bold()
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .font(.inter(.regular, size: 12))
                        .foregroundColor(.listHeaderForeground)
                        .listRowBackground(Color.listCellBackground)
                        
                        ForEach(vm.topTraders, id: \.self) { trader in
                            HStack {
                                Text("\((vm.topTraders.firstIndex(of: trader) ?? 0) + 1)")
                                    .frame(width: 25, alignment: .leading)
                                Text(trader.country)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .font(.inter(.bold, size: 25))
                                Text(trader.name)
                                    .frame(maxWidth: .infinity)
                                Text("$\(trader.deposit)")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                Text("\(trader.profit)")
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            .font(.inter(.regular, size: 14))
                            .foregroundColor(.white)
                            .listRowBackground((vm.topTraders.firstIndex(of: trader) ?? 0) % 2 == 0 ? .topTradersBackground : Color.listCellBackground)
                        }
                        
                    }
                    .environment(\.defaultMinListRowHeight, 50)
                    .listBackground(color: .topTradersBackground)
            }
        }
        .onReceive(timer) {_ in
            withAnimation(.easeInOut) {
                vm.randomProfitChange()
            }
        }
    }
}


#Preview {
    TopTradersView()
}
