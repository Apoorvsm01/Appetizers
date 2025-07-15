//
//  Alert.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/12/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: Text
    var message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
//    - Network Alerts
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server is invalid. Please contact support"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Invalid Scan Type"),
                                            message: Text("Invalid response from the server. "),
                                            dismissButton: .default(Text("OK")))

    static let invalidURL       = AlertItem(title: Text("URL error"),
                                            message: Text("There might be an issue with the server"),
                                            dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Requestion cannot be completed"),
                                            message: Text("Unable to complete your request. Please try again later"),
                                            dismissButton: .default(Text("OK")))
    
//    - Account Alerts
    
    static let invalidEmail    = AlertItem(title: Text("Invalid Email"),
                                           message: Text("Please enter a valid email"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidForm    = AlertItem(title: Text("Invalid Form"),
                                           message: Text("Please ensure all fields are filled correctly"),
                                           dismissButton: .default(Text("OK")))
    
    static let userSaveSuccess    = AlertItem(title: Text("Profile Saved"),
                                           message: Text("Your information has been saved"),
                                           dismissButton: .default(Text("OK")))
    
    static let invalidUserData    = AlertItem(title: Text("Profile Error"),
                                           message: Text("There was an error saving or retrieving your data. Please try again later"),
                                           dismissButton: .default(Text("OK")))
}

