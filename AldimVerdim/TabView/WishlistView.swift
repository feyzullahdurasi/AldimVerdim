//
//  WishlistView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import SwiftUI

struct WishlistView: View {
    
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    let listing: Listing
    
    var body: some View {
        VStack {
            NavigationStack{
                ScrollView{
                    Text("Wishlist")
                        .padding(.top)
                        .font(.title)
                    LazyVStack{
                        ForEach(viewModel.listings.filter { $0.favorite }) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    WishlistView( listing: DeveloperPreview.shared.listings[0])
}
