//
//  Listing.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerId: String
    let userName: String
    let userPass: String
    let ownerName: String
    let productName: String
    var mainImageURL: String
    let callNumber: String
    var imageURLs: [String]
    let price: Int
    let year: Int
    let km: Int
    let automatic: Bool
    let manual: Bool
    let diesel: Bool
    let gasoline: Bool
    let electric: Bool
    let hybrit: Bool
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeatures]
    var type: ListingType
    
}

enum ListingFeatures: Int, Codable, Hashable, Identifiable {
    case selfCheckIn
    case superHost
    
    var id: Int { return self.rawValue}
}

enum ListingType: Int, Codable, Hashable, Identifiable {
    case suv
    case sedan
    case hachback
    
    var description: String {
        switch self {
        case .suv: return "Arazi Aracı"
        case .sedan: return "Sedan"
        case .hachback: return "Hachback"
        }
    }
    
    var id: Int { return self.rawValue}
}
