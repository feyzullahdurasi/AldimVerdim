import Foundation

struct Listing: Identifiable, Codable {
    let id: String
    let ownerId: String
    let userName: String
    let userPass: String
    let ownerName: String
    // ... diğer özellikler
} 