//
//  Details.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import SwiftUI

struct Details: View {
    let listing: Listing
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    Text("Fiyat")
                    Spacer()
                    Text("\(listing.price)₺")
                        .bold()
                }
                .padding(.horizontal)
                Divider()
            }
            infoRow(title: "İlan No", value: listing.id)
            infoRow(title: "Model", value: listing.productName)
            infoRow(title: "Yıl", value: "\(listing.year)")
            if listing.diesel {
                infoRow(title: "Yakıt", value: "Dizel")
            } else if listing.gasoline {
                infoRow(title: "Yakıt", value: "Benzin")
            } else if listing.electric {
                infoRow(title: "Yakıt", value: "Elektrik")
            } else {
                infoRow(title: "Yakıt", value: "Hibrit")
            }
            VStack {
                HStack {
                    Text("KM")
                    Spacer()
                    Text("\(listing.km)")
                }
                .padding(.horizontal)
                Divider()
            }
            if listing.automatic {
                infoRow(title: "Vites", value: "Otomatik")
            } else {
                infoRow(title: "Vites", value: "Manuel")
            }
            infoRow(title: "Tipi", value: listing.type.description)
            
            
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        
    }
    
    func infoRow(title: String, value: String) -> some View {
        VStack {
            HStack {
                Text(title)
                Spacer()
                Text(value)
            }
            .padding(.horizontal)
            Divider()
        }
    }
}

#Preview {
    Details(listing: DeveloperPreview.shared.listings[0])
}
