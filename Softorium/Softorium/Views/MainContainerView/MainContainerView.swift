//
//  MainContainerView.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import SwiftUI

struct MainContainerView: View {
    @StateObject var vm: MainContainerViewModel = MainContainerViewModel()
    
    var body: some View {
        if !vm.permissionRequested {
            PreloaderView(isLoading: $vm.isLoading)
                .onChange(of: vm.isLoading) { value in
                    if value == false {
                        vm.requestNotificationPermission()
                    }
                }
        } else {
            MainTabView()
        }
        
    }
}

#Preview {
    MainContainerView()
}
