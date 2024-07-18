//
//  LoginView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 18.07.2024.
//

import SwiftUI

struct LoginView: View {
    
    @State private var userName = ""
    @State private var userPass = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Text("Giriş Yap")
                .font(.title)
            
            HStack {
                Image(systemName: "mail")
                TextField("Kullanıcı Adı", text: $userName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
            .modifier(CollapsibleDestinationViewModifier_())
            HStack {
                Image(systemName: "lock")
                SecureField("Şifre", text: $userPass)
                Spacer()
                
            }
            .modifier(CollapsibleDestinationViewModifier_())
            
            Button("Giriş Yap") {
                login()
            }
            .foregroundColor(.white)
            .frame(width: UIScreen.main.bounds.width / 1.1 , height: 50)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Giriş Durumu"), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
            }
            .fullScreenCover(isPresented: $isLoggedIn, content: {
                MainTabView(listing: DeveloperPreview.shared.listings.first!)
            })
            
        }
        .padding()
    }
    
    func login() {
        // Kullanıcı adı ve şifreyi kontrol et
        let isUser = DeveloperPreview.shared.listings.contains { listing in
            return listing.userName == userName && listing.userPass == userPass
        }
        
        // Sonuç mesajını ayarla
        if isUser {
            isLoggedIn = true
        } else {
            alertMessage = "Kullanıcı adı veya şifre hatalı!"
            showAlert = true
        }
        
    }
}

#Preview {
    LoginView()
}

struct CollapsibleDestinationViewModifier_: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 30)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
