//
//  SearchView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 19.07.2024.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var show: Bool
    
    @State private var searchWord = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Ara", text: $searchWord)
            Spacer()
            Button {
                withAnimation(.snappy) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .imageScale(.large)
            }
        }
        .frame(height: 50)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .overlay{
            Capsule()
                .stroke(lineWidth: 1)
                .foregroundColor(Color(.systemGray2))
                .shadow(color: .black.opacity(0.5), radius: 2)
        }
    }
}

#Preview {
    SearchView(show: .constant(false))
}
