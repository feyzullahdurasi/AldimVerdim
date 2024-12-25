import Foundation

struct FilterModel: Codable {
    var priceRange: ClosedRange<Double>
    var yearRange: ClosedRange<Int>
    var kmRange: ClosedRange<Int>
    var fuelTypes: Set<FuelType>
    var transmissionTypes: Set<TransmissionType>
    var sortOption: SortOption
    var searchQuery: String
    
    enum FuelType: String, Codable, CaseIterable {
        case diesel = "Dizel"
        case gasoline = "Benzin"
        case electric = "Elektrik"
        case hybrid = "Hibrit"
    }
    
    enum TransmissionType: String, Codable, CaseIterable {
        case automatic = "Otomatik"
        case manual = "Manuel"
    }
    
    enum SortOption: String, Codable, CaseIterable {
        case priceAsc = "Fiyat (Artan)"
        case priceDesc = "Fiyat (Azalan)"
        case yearDesc = "Yıl (Yeni)"
        case yearAsc = "Yıl (Eski)"
        case kmAsc = "Kilometre (Az)"
        case kmDesc = "Kilometre (Çok)"
    }
} 