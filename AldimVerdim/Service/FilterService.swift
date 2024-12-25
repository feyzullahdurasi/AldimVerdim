//
//  FilterService.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 25.12.2024.
//

import Foundation

class FilterService {
    static let shared = FilterService()
    private let baseURL = "http://your-backend-url/api"
    
    private init() {}
    
    func applyFilters(_ filter: FilterModel) async throws {
        guard let url = URL(string: "\(baseURL)/filters/apply") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        request.httpBody = try encoder.encode(filter)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // Response'u işle
        let decoder = JSONDecoder()
        _ = try decoder.decode([Listing].self, from: data)
    }
} 
