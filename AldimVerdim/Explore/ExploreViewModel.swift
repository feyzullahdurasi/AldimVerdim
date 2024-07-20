//
//  ExploreViewModel.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import Foundation
import Combine

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    private let service: ExploreService
    @Published var filteredListings: [Listing] = []
    @Published var searchWord = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
        
        $searchWord
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] newSearchWord in
                self?.applySearchFilter(searchWord: newSearchWord)
            })
            .store(in: &cancellables)
    }
    
    func fetchListings() async {
        do {
            
            self.listings = try await service.fetchListings()
            self.filteredListings = listings
            
            
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    func filterListings(minPrice: String?, maxPrice: String?) {
        filteredListings = listings.filter { listing in
            let price = Int(listing.price)
            
            let isPriceValid = (minPrice == nil || price >= (Int(minPrice!) ?? 0)) && (maxPrice == nil || price <= (Int(maxPrice!) ?? 0))
            
            return isPriceValid
        }
    }
    
    func sortListings(by option: SortOption) {
        switch option {
        case .random:
            filteredListings.shuffle()
        case .priceAscending:
            filteredListings.sort { ($0.price) < ($1.price) }
        case .priceDescending:
            filteredListings.sort { (Int($0.price)) > (Int($1.price)) }
        case .yearAscending:
            filteredListings.sort { Int($0.year) < Int($1.year) }
        case .yearDescending:
            filteredListings.sort { Int($0.year) > Int($1.year) }
        case .kmAscending:
            filteredListings.sort { Int($0.km) < Int($1.km) }
        case .kmDescending:
            filteredListings.sort { Int($0.km) > Int($1.km) }
        }
    }
    
    private func applySearchFilter(searchWord: String) {
        if searchWord.isEmpty {
            
            filteredListings = listings
        } else {
            filteredListings = listings.filter { listing in
                listing.productName.localizedCaseInsensitiveContains(searchWord)
            }
        }
    }
}
    

    enum SortOption {
        case random
        case priceAscending
        case priceDescending
        case yearAscending
        case yearDescending
        case kmAscending
        case kmDescending
    }

