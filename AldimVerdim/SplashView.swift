//
//  SplashView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 2.10.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        if isActive {
            if appState.isAuthenticated {
                MainTabView()
            } else {
                OnboardingView()
            }
        } else {
            VStack {
                Image("app-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Aldım Verdim")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                appState.checkAuthentication()
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct OnboardingView: View {
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @EnvironmentObject private var appState: AppState
    
    let pages = [
        OnboardingPage(title: "Hoş Geldiniz", 
                      description: "Aldım Verdim'e hoş geldiniz", 
                      imageName: "welcome-image"),
        OnboardingPage(title: "Kolay Kullanım", 
                      description: "İhtiyacınız olan her şey parmaklarınızın ucunda", 
                      imageName: "easy-use"),
        OnboardingPage(title: "Güvenli Alışveriş", 
                      description: "Güvenli ve hızlı alışveriş deneyimi", 
                      imageName: "secure-shopping")
    ]
    
    var body: some View {
        if hasSeenOnboarding {
            LoginView()
        } else {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    TabView(selection: $currentPage) {
                        ForEach(0..<pages.count) { index in
                            OnboardingPageView(page: pages[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    
                    Button(action: {
                        if currentPage < pages.count - 1 {
                            withAnimation {
                                currentPage += 1
                            }
                        } else {
                            hasSeenOnboarding = true
                        }
                    }) {
                        Text(currentPage < pages.count - 1 ? "İleri" : "Başla")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.pink)
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

struct OnboardingPage: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let imageName: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 20) {
            Image(page.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            Text(page.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(page.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    SplashView()
}
