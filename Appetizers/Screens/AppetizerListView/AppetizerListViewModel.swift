//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/12/25.
//

import SwiftUI

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        Task {
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case.invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case.invalidURL:
                        alertItem = AlertContext.invalidURL
                    
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}

// old code

//func getAppetizers() {
//    isLoading = true
//    NetworkManager.shared.getAppetizers { result in
//        DispatchQueue.main.async { [self] in
//            isLoading = false
//            switch result {
//            case .success(let appetizers):
//                self.appetizers = appetizers
//                
//            case .failure(let error):
//                switch error {
//                case .invalidResponse:
//                    alertItem = AlertContext.invalidResponse
//                    
//                case .invalidURL:
//                    alertItem = AlertContext.invalidURL
//                    
//                case .invalidData:
//                    alertItem = AlertContext.invalidData
//                    
//                case .unableToComplete:
//                    alertItem = AlertContext.unableToComplete
//                }
//            }
//        }
//    }
//}

