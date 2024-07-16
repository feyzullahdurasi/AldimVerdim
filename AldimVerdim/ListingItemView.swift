//
//  ListingView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 14.07.2024.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        HStack{
            //image
            Image(listing.mainImageURL)
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            // details
            HStack (alignment: .top){
                VStack{
                    Text(listing.productName)
                        .fontWeight(.semibold)
                    Text(listing.km)
                    if listing.automatic {
                        Text("Otomatik")
                    } else {
                        Text("Manuel")
                    }
                    
                    
                }
                Spacer()
                VStack(spacing: 35) {
                    HStack{
                        Image(systemName: "star.fill")
                        Text("\(listing.rating)")
                        
                    }
                    
                    Text("\(listing.price) ₺")
                        .foregroundColor(.init(red: 0.1, green: 0.3, blue: 1.5))
                }
            }
        }
        .foregroundColor(.black)
        
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
