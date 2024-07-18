//
//  FilterBar.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct FilterBar: View {
    
    @State private var showDestinationSearchView = false
    @State private var showDestinationSortView = false
    
    var body: some View {
        NavigationStack{
            if(showDestinationSearchView) {
                DestinationSearchView(show: $showDestinationSearchView)
            } else if showDestinationSortView {
                DestinationSortView(show: $showDestinationSortView, viewModel: ExploreViewModel(service: ExploreService()))
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
                    
                    HStack {
                        
                        Image(systemName: "heart")
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width / 9, height: 50)
                    .overlay{
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.systemGray2))
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                    HStack {
                        Image(systemName: "person.and.person")
                        
                        
                        
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

#Preview {
    FilterBar()
}
