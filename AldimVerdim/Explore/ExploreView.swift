//
//  SwiftUIView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 14.07.2024.
//

import SwiftUI

struct ExploreView: View {
    
    
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    let listing: Listing
    
    var body: some View {
        NavigationStack{
            FilterBar()
                ScrollView{
                    
                        
                    
                    LazyVStack{
                        ForEach(viewModel.listings) { listing in
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


#Preview {
    ExploreView( listing: DeveloperPreview.shared.listings[0])
}
