//
//  ProfileView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Aldım Verdim App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 120.0)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading) {
                        Text("Profil")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Giriş yapmak için butona tıkla")
                    }
                    
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Giriş Yap")
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width / 1.1 , height: 50)
                            .fontWeight(.bold)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    
                    HStack {
                        Text("Kayıt olmadınız mı?")
                        NavigationLink(destination: SigninView()) {
                            Text("Kayıt ol")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .underline()
                        }
                    }
                    .font(.caption)
                }
            }
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 150)
        }
        
    }
}

#Preview {
    ProfileView()
}
