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
                .frame(width: 100, height: 100)
            // details
            HStack (alignment: .top){
                VStack{
                    Text(listing.productName)
                        .fontWeight(.semibold)
                    Text("\(listing.km)")
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
                            .foregroundColor(.yellow)
                        Text("\(String(format: "%.1f", listing.rating))")
                    }
                    Text("\(listing.price) ₺")
                        .foregroundColor(.init(red: 0.1, green: 0.3, blue: 0.3))
                        
                }
            }
        }
        .foregroundColor(.black)
        
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
