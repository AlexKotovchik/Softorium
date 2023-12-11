//
//  MainContainerViewModel.swift
//  Softorium
//
//  Created by AlexKotov on 11.12.23.
//

import Foundation
import SwiftUI

class MainContainerViewModel: ObservableObject {
    @Published var isLoading: Bool = true
    @Published var permissionRequested: Bool = false
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                self.permissionRequested = true
                return
            } else {
                self.permissionRequested = true
            }
        }
    }
}
