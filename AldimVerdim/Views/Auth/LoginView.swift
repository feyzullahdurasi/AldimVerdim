import SwiftUI

struct LoginView: View {
    @State private var userName = ""
    @State private var userPass = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    @EnvironmentObject private var appState: AppState
    let listing = DeveloperPreview.shared.listings.first!
    
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
                Alert(title: Text("Giriş Durumu"), 
                      message: Text(alertMessage), 
                      dismissButton: .default(Text("Tamam")))
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                MainTabView(listing: listing)
            }
        }
        .padding()
    }
    
    func login() {
        let isUser = DeveloperPreview.shared.listings.contains { listing in
            return listing.userName == userName && listing.userPass == userPass
        }
        
        if isUser {
            isLoggedIn = true
            appState.isAuthenticated = true
        } else {
            alertMessage = "Kullanıcı adı veya şifre hatalı!"
            showAlert = true
        }
    }
} 