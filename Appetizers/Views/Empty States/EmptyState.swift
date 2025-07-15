//
//  EmptyState.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/14/25.
//

import SwiftUI

struct EmptyState: View {
   
    let imageName: String
    let message: String
    
    var body: some View {
    
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -30)
        }
        
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "This is a really really loong test image to see the multiline centering")
}
