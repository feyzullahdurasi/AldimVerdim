//
//  ProfileView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Text("Profil")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Giriş yapmak için butona tıkla")
            }
            
               
            Button {
                
            } label: {
                Text("Giriş Yap")
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.1 , height: 40)
                    .fontWeight(.bold)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
            }
            
            HStack {
                Text("Kayıt olmadınız mı?")
                
                Text("Kayıt ol")
                    .fontWeight(.semibold)
                    .underline()
            }
            .font(.caption)
            
        }
        
    }
}

#Preview {
    ProfileView()
}
