import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @EnvironmentObject private var appState: AppState
    let listing = DeveloperPreview.shared.listings.first!
    
    var body: some View {
        if isActive {
            if appState.isAuthenticated {
                MainTabView(listing: listing)
            } else {
                OnboardingView()
            }
        } else {
            // ... mevcut kod ...
        }
    }
} 