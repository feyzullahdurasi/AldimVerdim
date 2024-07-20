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
    @State private var isDetailView = false
    @State private var showSearchView = false
    @State private var showDestinationSearchView = false
    @State private var showDestinationSortView = false
    @State private var searchWord = ""
    
    var body: some View {
        VStack {
            if !isDetailView {
                FilterBar(
                    showDestinationSearchView: $showDestinationSearchView,
                    showDestinationSortView: $showDestinationSortView,
                    showSearchView: $showSearchView,
                    searchWord: $searchWord
                )
                .frame(height: !isDetailView ? 54 : 700)
                .transition(.move(edge: .top))
                .animation(.easeInOut, value: !isDetailView)
                
            }
            
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.filteredListings) { listing in
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
                        .onAppear {
                            isDetailView = true
                        }
                        .onDisappear {
                            isDetailView = false
                        }
                }
            }
        }
        .onChange(of: searchWord) { newValue, asas in
            viewModel.searchWord = newValue
        }
    }
}

#Preview {
    ExploreView(listing: DeveloperPreview.shared.listings[0])
}
