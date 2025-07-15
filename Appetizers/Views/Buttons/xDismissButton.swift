//
//  xDismissButton.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/14/25.
//

import SwiftUI

struct xDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    xDismissButton()
}
