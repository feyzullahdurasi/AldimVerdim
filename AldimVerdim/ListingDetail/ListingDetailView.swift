//
//  ListingDetailView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: String? = "Detay"
    let listing: Listing
    
    
    var body: some View {
        ScrollView {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        
                }
                Spacer()
                Text(listing.title)
                    .multilineTextAlignment(.center)
                    
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "star")
                        
                }
                
            }
            .padding(.horizontal)
            
            TabView{
                ForEach(listing.imageURLs, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                }
                    
                
            }
            .frame(height: 320)
            .tabViewStyle(.page)
            Text("Vasıta > Otomobil > BMW > 5 Serisi > 520d > Premium")
                .font(.caption)
                .foregroundColor(.blue)
            Divider()
            
            HStack {
                Text(listing.ownerName)
                    .fontWeight(.bold)
                Spacer()
                VStack(alignment: .trailing){
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("\(listing.rating)")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "location.circle")
                        Text("\(listing.city),\(listing.state)")
                            .underline()
                    }
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                }
                
            }
            .padding()
            
            Divider()
            
            HStack {
                Text("Detay")
                    .frame(width: UIScreen.main.bounds.width / 3.25, height: 50)
                    .overlay {
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color.yellow)
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                    .onTapGesture {
                        selectedTab = "Detay"
                    }
                Text("Açıklama")
                    .frame(width: UIScreen.main.bounds.width / 3.25, height: 50)
                    .overlay{
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.yellow))
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                    .onTapGesture {
                        selectedTab = "Açıklama"
                    }
                Text("Ekspertiz")
                    .frame(width: UIScreen.main.bounds.width / 3.25, height: 50)
                    .overlay{
                        Capsule()
                            .stroke(lineWidth: 1)
                            .foregroundColor(Color(.yellow))
                            .shadow(color: .black.opacity(0.5), radius: 2)
                    }
                    .onTapGesture {
                        selectedTab = "Ekspertiz"
                    }
            }
            if let tab = selectedTab {
                
                    if tab == "Detay" {
                        Details(listing: listing)
                            
                    } else if tab == "Açıklama" {
                        Text("Açıklama bilgileri burada listelenecek.")
                            .padding()
                    } else if tab == "Ekspertiz" {
                        Text("Ekspertiz bilgileri burada listelenecek.")
                            .padding()
                    }
                
                
                
                
            }
            
        }
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Button("Ara") {
                        if let phoneCallURL = URL(string: "tel://\(listing.callNumber)"),
                           UIApplication.shared.canOpenURL(phoneCallURL) {
                            UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
                        } else {
                            // Telefon numarası geçersiz veya arama yapılamıyor
                        }
                    }
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width / 2.25, height: 50)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button("Mesaj") {
                        if let smsURL = URL(string: "sms:\(listing.callNumber)"),
                           UIApplication.shared.canOpenURL(smsURL) {
                            UIApplication.shared.open(smsURL, options: [:], completionHandler: nil)
                        } else {
                            // Telefon numarası geçersiz veya SMS gönderilemiyor
                        }
                    }
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width / 2.25, height: 50)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView( listing: DeveloperPreview.shared.listings[0])
}
