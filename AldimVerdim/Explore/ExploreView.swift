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
    
    var body: some View {
        
            VStack {
                if !isDetailView {
                    FilterBar()
                        .frame(height: 55)
                }
                NavigationStack{
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
                        .onAppear {
                            isDetailView = true
                        }
                        .onDisappear {
                            isDetailView = false
                        }
                }
            }
        }
    }
}


#Preview {
    ExploreView( listing: DeveloperPreview.shared.listings[0])
}
