//
//  SigninView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 18.07.2024.
//

import SwiftUI

struct SigninView: View {
    
    @State private var userName = ""
    @State private var ownerName = ""
    @State private var userPass = ""
    @State private var userPass1 = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    
    private func isValidPassword(_ userPass: String) -> Bool {
         let passwordRegex = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        return passwordRegex.evaluate(with: userPass)
    }
    
    var body: some View {
        VStack {
            Text("Kayıt Ol")
                .font(.title)
            
            HStack {
                Image(systemName: "mail")
                TextField("Kullanıcı Adı", text: $userName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                Spacer()
                if userName.count != 0 {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier_())
            
            HStack {
                Image(systemName: "house")
                TextField("İşletme Adı", text: $ownerName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                Spacer()
                if !ownerName.isEmpty {
                    Image(systemName: "checkmark")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier_())
            HStack {
                Image(systemName: "lock")
                SecureField("Şifre", text: $userPass)
                Spacer()
                if !userPass.isEmpty {
                    Image(systemName: isValidPassword(userPass) ? "checkmark" : "xmark")
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword(userPass) ? .green : .red)
                }
                
                    
            }
            .modifier(CollapsibleDestinationViewModifier_())
            if !userPass.isEmpty {
                if !isValidPassword(userPass) {
                    VStack(alignment: .leading) {
                        Text("* En az 6 Karakter içermeli ")
                        Text("* En az bir Özel Karakter içermeli ")
                        Text("* En az bir Büyük Karakter içermeli ")
                    }
                }
            }
            
            HStack {
                Image(systemName: "lock")
                SecureField("Şifreyi Tekrarla", text: $userPass1)
                Spacer()
                if !userPass1.isEmpty {
                    Image(systemName: isValidPassword(userPass1) ? "checkmark" : "xmark")
                        .fontWeight(.bold)
                        .foregroundColor(isValidPassword(userPass1) ? .green : .red)
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier_())
            if !userPass1.isEmpty {
                if !isValidPassword(userPass1) {
                    VStack(alignment: .leading) {
                        Text("* En az 6 Karakter içermeli ")
                        Text("* En az bir Özel Karakter içermeli ")
                        Text("* En az bir Büyük Karakter içermeli ")
                    }
                }
            }
            
            Button("Kayıt Ol") {
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
        
        if userName != "" && userPass != "" && ownerName != "" && userPass1 != "" && userPass == userPass1 {
            isLoggedIn = true
        
        } else {
            alertMessage = "Kullanıcı adı veya şifre hatalı!"
            
        }
        showAlert = true
    }
}

#Preview {
    SigninView()
}
