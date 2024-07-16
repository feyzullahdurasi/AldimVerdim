//
//  ListingDetailView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        
                }
                Text("Araç tamamen orjinal Hayalet+Vakum Araç tamamen orjinal")
                    .multilineTextAlignment(.center)
                    
                Button {
                    
                } label: {
                    Image(systemName: "star")
                        
                }
                
            }
            .padding(.horizontal)
            
            TabView{
                Rectangle()
                    .foregroundColor(.yellow)
            }
            .frame(height: 320)
            .tabViewStyle(.page)
            Text("Vasıta > Otomobil > BMW > 5 Serisi > 520d > Premium")
                .font(.caption)
                .foregroundColor(.blue)
            Divider()
            
            HStack {
                Text("Ahmet Kaya Oto")
                    .fontWeight(.bold)
                Spacer()
                VStack(alignment: .trailing){
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("4.1")
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "location.circle")
                        Text("Balıkesir,Karesi")
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
                .overlay{
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color(.yellow))
                        .shadow(color: .black.opacity(0.5), radius: 2)
                }
                    Text("Açıklama")
                .frame(width: UIScreen.main.bounds.width / 3.25, height: 50)
                .overlay{
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color(.yellow))
                        .shadow(color: .black.opacity(0.5), radius: 2)
                }
                    Text("Ekspertiz")
                        .frame(width: UIScreen.main.bounds.width / 3.25, height: 50)
                .overlay{
                    Capsule()
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color(.yellow))
                        .shadow(color: .black.opacity(0.5), radius: 2)
                }
            }
            
        }
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Button("Ara") {
                        
                    }
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width / 2.25, height: 50)
                    .background(.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    Button("Mesaj") {
                        
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
    ListingDetailView()
}
