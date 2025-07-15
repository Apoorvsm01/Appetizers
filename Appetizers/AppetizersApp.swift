//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/12/25.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
