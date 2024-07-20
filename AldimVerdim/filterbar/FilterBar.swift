//
//  FilterBar.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct FilterBar: View {
    
    @Binding var showDestinationSearchView: Bool
    @Binding var showDestinationSortView: Bool
    @Binding var showSearchView: Bool
    @Binding var searchWord: String
    @State private var isHeartFilled = false
    @State private var isShared = false
    
    var body: some View {
        NavigationStack{
            VStack {
                if showDestinationSearchView {
                    DestinationSearchView(show: $showDestinationSearchView)
                } else if showDestinationSortView {
                    DestinationSortView(show: $showDestinationSortView, viewModel: ExploreViewModel(service: ExploreService()))
                } else if showSearchView {
                    SearchView(show: $showSearchView, searchWord: $searchWord)
                }else {
                    HStack {
                        
                        HStack {
                            Image(systemName: "list.bullet.indent")
                            
                            Text("Filtre")
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 4, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(.systemGray2))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                        }
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                        
                        HStack {
                            Text("Sırala")
                        }
                        .frame(width: UIScreen.main.bounds.width / 5, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(.systemGray2))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                        }
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSortView.toggle()
                            }
                        }
                        
                        HStack {
                            Image(systemName: "magnifyingglass")
                            
                            Text("Ara")
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 5, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(.systemGray2))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                        }
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showSearchView.toggle()
                            }
                        }
                        
                        HStack {
                            
                            Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                .foregroundColor(isHeartFilled ? .red : .black)
                                .onTapGesture {
                                    isHeartFilled.toggle()
                                }
                        }
                        .frame(width: UIScreen.main.bounds.width / 9, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(.systemGray2))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                        }
                        
                        HStack {
                            ShareLink(item: URL(string: "https://github.com/feyzullahdurasi")!) {
                                Image(systemName: "person.2")
                                    .foregroundColor(.black)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 9, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(lineWidth: 1)
                                .foregroundColor(Color(.systemGray2))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                        }
                    }
                }
            }
            
            
        }
        
    }
}

#Preview {
    FilterBar(showDestinationSearchView: .constant(false), showDestinationSortView: .constant(false), showSearchView: .constant(false), searchWord: .constant(""))
}
