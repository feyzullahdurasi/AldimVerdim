import Foundation
import Combine

class FilterBarViewModel: ObservableObject {
    @Published var filter = FilterModel(
        priceRange: 0...1000000,
        yearRange: 2000...2024,
        kmRange: 0...500000,
        fuelTypes: [],
        transmissionTypes: [],
        sortOption: .priceAsc,
        searchQuery: ""
    )
    
    @Published var showFilterSheet = false
    @Published var showSortSheet = false
    @Published var activeFilters: [String] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupBindings()
    }
    
    private func setupBindings() {
        // Filter değişikliklerini izle
        $filter
            .sink { [weak self] filter in
                self?.updateActiveFilters(with: filter)
            }
            .store(in: &cancellables)
    }
    
    func updateActiveFilters(with filter: FilterModel) {
        var filters: [String] = []
        
        // Fiyat aralığı
        if filter.priceRange != 0...1000000 {
            filters.append("₺\(Int(filter.priceRange.lowerBound))-\(Int(filter.priceRange.upperBound))")
        }
        
        // Yakıt tipleri
        filter.fuelTypes.forEach { filters.append($0.rawValue) }
        
        // Vites tipleri
        filter.transmissionTypes.forEach { filters.append($0.rawValue) }
        
        activeFilters = filters
    }
    
    func removeFilter(_ filter: String) {
        // Filtre kaldırma mantığı
    }
    
    func applyFilters() {
        // Backend'e filtre gönderme
        Task {
            do {
                try await FilterService.shared.applyFilters(filter)
            } catch {
                print("Filtre uygulanırken hata: \(error)")
            }
        }
    }
    
    func resetFilters() {
        filter = FilterModel(
            priceRange: 0...1000000,
            yearRange: 2000...2024,
            kmRange: 0...500000,
            fuelTypes: [],
            transmissionTypes: [],
            sortOption: .priceAsc,
            searchQuery: ""
        )
    }
} 