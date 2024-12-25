//
//  User.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 24.12.2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let userName: String
    let ownerName: String
    var email: String?
    var phoneNumber: String?
    
    // Opsiyonel olarak daha fazla kullanıcı bilgisi eklenebilir
} 
