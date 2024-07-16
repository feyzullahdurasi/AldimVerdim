//
//  MainTabView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import SwiftUI

struct MainTabView: View {
    let listing: Listing
    var body: some View {
        TabView {
            ExploreView( listing: listing)
                .tabItem { Label("Keşfet", systemImage: "magnifyingglass") }
            
            WishlistView()
                .tabItem { Label("Favoriler", systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profil", systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView(listing: DeveloperPreview.shared.listings[0])
}
