import Foundation

struct User: Codable, Identifiable {
    let id: String
    let userName: String
    let ownerName: String
    var email: String?
    var phoneNumber: String?
    
    // Opsiyonel olarak daha fazla kullanıcı bilgisi eklenebilir
} 