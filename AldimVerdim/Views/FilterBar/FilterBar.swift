import SwiftUI

struct FilterBar: View {
    @StateObject private var viewModel = FilterBarViewModel()
    @Binding var showDestinationSearchView: Bool
    @Binding var showDestinationSortView: Bool
    @Binding var searchWord: String
    
    var body: some View {
        VStack(spacing: 12) {
            HStack(spacing: 12) {
                // Filtre Butonu
                FilterButton(
                    title: "Filtre",
                    icon: "slider.horizontal.3",
                    action: { viewModel.showFilterSheet.toggle() }
                )
                
                // Sıralama Butonu
                FilterButton(
                    title: "Sırala",
                    icon: "arrow.up.arrow.down",
                    action: { viewModel.showSortSheet.toggle() }
                )
                
                // Arama Butonu
                SearchBar(text: $searchWord)
            }
            .padding(.horizontal)
            
            // Aktif Filtreler
            if !viewModel.activeFilters.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.activeFilters, id: \.self) { filter in
                            ActiveFilterChip(
                                title: filter,
                                onRemove: { viewModel.removeFilter(filter) }
                            )
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .sheet(isPresented: $viewModel.showFilterSheet) {
            FilterSheet(viewModel: viewModel)
        }
        .sheet(isPresented: $viewModel.showSortSheet) {
            SortSheet(viewModel: viewModel)
        }
    }
}

// Alt bileşenler
struct FilterButton: View {
    let title: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
            .frame(height: 44)
            .padding(.horizontal, 16)
            .background(Color(.systemGray6))
            .cornerRadius(22)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Ara...", text: $text)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(22)
    }
} 