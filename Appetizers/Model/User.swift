//
//  User.swift
//  Appetizers
//
//  Created by Apoorv Mahajan on 7/14/25.
//

import Foundation

struct User: Codable {
    
    var firstName: String       = ""
    var lastName: String        = ""
    var email: String           = ""
    var birthdate: Date         = Date()
    var extraNapkins: Bool      = false
    var extraChips: Bool        = false
}
