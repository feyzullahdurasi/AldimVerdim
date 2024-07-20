//
//  FullscreenImageView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 19.07.2024.
//

import SwiftUI

struct FullscreenImageView: View {
    
    let image: String
    @Binding var isPresented: Bool
    var listing: Listing
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TabView {
                ForEach(listing.imageURLs, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        
                }
            }
            .tabViewStyle(.page)
            
        }
    }
}

#Preview {
    FullscreenImageView(image: DeveloperPreview.shared.listings[0].imageURLs[0], isPresented: .constant(false), listing: DeveloperPreview.shared.listings[0])
}

