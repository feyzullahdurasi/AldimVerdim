//
//  MainTabView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import SwiftUI

struct MainTabView: View {
    //@StateObject var viewModel = ExploreViewModel(service: ExploreService())
    let listing: Listing
    
    var body: some View {
        
        TabView {
            ExploreView( listing: listing)
                .tabItem { Label("Keşfet", systemImage: "magnifyingglass") }
            
            WishlistView( listing: listing)
                .tabItem { Label("Favoriler", systemImage: "heart") }
            
            MainProfileView(listing: listing)
                .tabItem { Label("Profil", systemImage: "person") }
        }
        .background(.white)
        /*.navigationDestination(for: Listing.self) { listing in
            ListingDetailView(listing: listing, isDetailView: $isDetailView)
                .navigationBarBackButtonHidden()
        }*/
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    MainTabView(listing: DeveloperPreview.shared.listings[0])
}

