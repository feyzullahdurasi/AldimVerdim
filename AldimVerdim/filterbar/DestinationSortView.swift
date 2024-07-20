//
//  DestinationSortView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 17.07.2024.
//

import SwiftUI

struct DestinationSortView: View {
    
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Sıralama")
                    .font(.title)
                    .padding()
                ExtractedView2(title: "Rastgele olarak Sırala", action: { viewModel.sortListings(by: .random) })
                    .modifier(CollapsibleDestinationViewModifier2())
                    
                
                ExtractedView2(title: "Ucuzdan Pahalıya", action: { viewModel.sortListings(by: .priceAscending) })
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "Pahalıdan Ucuza", action: { viewModel.sortListings(by: .priceDescending)})
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "Eskiden Yeniye", action: { viewModel.sortListings(by: .yearAscending)})
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "Yeniden Eskiye", action: { viewModel.sortListings(by: .yearDescending)})
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "Km Düşükten Yükseğe", action: { viewModel.sortListings(by: .kmAscending)})
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "Km Yüksekten Düşüğe", action: { viewModel.sortListings(by: .kmDescending)})
                    .modifier(CollapsibleDestinationViewModifier2())
                
                /*ExtractedView2(title: "İlan Tarihi Eskiden Yeniye")
                    .modifier(CollapsibleDestinationViewModifier2())
                
                ExtractedView2(title: "İlan Tarihi Yeniden Eskiye")
                    .modifier(CollapsibleDestinationViewModifier2())*/
                Spacer()
                
                Button("Vazgeç") {
                    withAnimation(.snappy) {show.toggle()}
                }
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            }
            .frame(height: 700)
            
        }
    }
}

#Preview {
    DestinationSortView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

struct ExtractedView2: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                action()
            }
        }
    }
}

struct CollapsibleDestinationViewModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .shadow(radius: 5)
        
    }
}

