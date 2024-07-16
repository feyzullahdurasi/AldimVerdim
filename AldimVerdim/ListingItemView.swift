//
//  ListingView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 14.07.2024.
//

import SwiftUI

struct ListingItemView: View {
    var body: some View {
        HStack{
            //image
            Rectangle()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            // details
            HStack (alignment: .top){
                VStack{
                    Text("bmw 5 series")
                        .fontWeight(.semibold)
                    Text("150.000 km")
                    Text("Otomatic")
                    
                }
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                    Text("4.1")
                }
            }
        }
        .foregroundColor(.black)
    }
}

#Preview {
    ListingItemView()
}
