//
//  CustomerModifiers.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/14/25.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
       content
        .buttonStyle(.bordered)
        .tint(.accentColor)
        .controlSize(.large)
    }
}

struct CellImageStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}
