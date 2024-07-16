//
//  FilterBar.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct FilterBar: View {
    var body: some View {
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

#Preview {
    FilterBar()
}
