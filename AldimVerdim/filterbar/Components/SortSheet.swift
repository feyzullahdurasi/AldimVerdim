//
//  SortSheet.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 25.12.2024.
//

import SwiftUI

struct SortSheet: View {
    @ObservedObject var viewModel: FilterBarViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List(FilterModel.SortOption.allCases, id: \.self) { option in
                Button(action: {
                    viewModel.filter.sortOption = option
                    viewModel.applyFilters()
                    dismiss()
                }) {
                    HStack {
                        Text(option.rawValue)
                        Spacer()
                        if viewModel.filter.sortOption == option {
                            Image(systemName: "checkmark")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
            }
            .navigationTitle("Sıralama")
        }
    }
} 
