import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var appState: AppState
    let listing: Listing
    
    var body: some View {
        TabView {
            ExploreView(listing: listing)
                .tabItem {
                    Label("Keşfet", systemImage: "magnifyingglass")
                }
            
            WishlistView(listing: listing)
                .tabItem {
                    Label("Favoriler", systemImage: "heart")
                }
            
            MainProfileView(listing: listing)
                .tabItem {
                    Label("Profil", systemImage: "person")
                }
        }
    }
} 