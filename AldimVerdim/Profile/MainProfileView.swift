//
//  MainProfileView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 18.07.2024.
//

import SwiftUI

struct MainProfileView: View {
    
    let listing: Listing
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    Image(systemName: "car.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text("Merhaba")
                        Text("\(listing.ownerName)")
                    }
                    Spacer()
                    NavigationLink(destination: ProfileView()) {
                        Text("Çıkış")
                    }
                    
                }
                .modifier(CollapsibleDestinationViewModifier())
                /*.frame(height: 50)
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .shadow(radius: 10)*/
                VStack(spacing: 15.0) {
                    Text("İşlemler")
                        .font(.title3)
                    horizantalStack(logo: "car.side", title: "Bakım Tarihi", date: "6700 km")
                    horizantalStack(logo: "cross", title: "Sigorta / Kasko Tarihi", date: "183 gün")
                    horizantalStack(logo: "cross", title: "Muayne Tarihi", date: "219 gün")
                }
                .modifier(CollapsibleDestinationViewModifier())
                
                VStack(spacing: 15.0) {
                    Text("Ödeme")
                        .font(.title3)
                    horizantalStack(logo: "steeringwheel", title: "Yazlık / Kışlık Lastik", date: "")
                    horizantalStack(logo: "cross", title: "Sigorta / Kasko ", date: "")
                    horizantalStack(logo: "car.ferry", title: "Oto Kuaför", date: "")
                    horizantalStack(logo: "car", title: "Yakıt", date: "")
                    horizantalStack(logo: "gear", title: "Oto ekspertiz", date: "")
                    horizantalStack(logo: "car.side", title: "Bakım", date: "")
                }
                .modifier(CollapsibleDestinationViewModifier())
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    MainProfileView(listing: DeveloperPreview.shared.listings[0])
}

struct horizantalStack: View {
    let logo: String
    let title: String
    let date: String
    //let tabTitle: String
    
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: logo)
            Text(title)
            Spacer()
            Text(date)
        }
        //.onTapGesture {tabTitle}
    }
}
