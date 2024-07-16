//
//  ExploreViewModel.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    
}
