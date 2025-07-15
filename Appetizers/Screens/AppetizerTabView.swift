//
//  ContentView.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/12/25.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house")
                }
            AccountView()
             
                .tabItem { Label("Account", systemImage: "person.circle")}
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag")}
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
