import SwiftUI

struct FilterSheet: View {
    @ObservedObject var viewModel: FilterBarViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                // Fiyat Aralığı
                Section(header: Text("Fiyat Aralığı")) {
                    PriceRangeSlider(range: $viewModel.filter.priceRange)
                }
                
                // Yıl Aralığı
                Section(header: Text("Yıl")) {
                    YearRangePicker(range: $viewModel.filter.yearRange)
                }
                
                // Kilometre Aralığı
                Section(header: Text("Kilometre")) {
                    KMRangeSlider(range: $viewModel.filter.kmRange)
                }
                
                // Yakıt Tipi
                Section(header: Text("Yakıt Tipi")) {
                    ForEach(FilterModel.FuelType.allCases, id: \.self) { type in
                        Toggle(type.rawValue, isOn: Binding(
                            get: { viewModel.filter.fuelTypes.contains(type) },
                            set: { isOn in
                                if isOn {
                                    viewModel.filter.fuelTypes.insert(type)
                                } else {
                                    viewModel.filter.fuelTypes.remove(type)
                                }
                            }
                        ))
                    }
                }
                
                // Vites Tipi
                Section(header: Text("Vites")) {
                    ForEach(FilterModel.TransmissionType.allCases, id: \.self) { type in
                        Toggle(type.rawValue, isOn: Binding(
                            get: { viewModel.filter.transmissionTypes.contains(type) },
                            set: { isOn in
                                if isOn {
                                    viewModel.filter.transmissionTypes.insert(type)
                                } else {
                                    viewModel.filter.transmissionTypes.remove(type)
                                }
                            }
                        ))
                    }
                }
            }
            .navigationTitle("Filtreler")
            .navigationBarItems(
                leading: Button("Sıfırla") {
                    viewModel.resetFilters()
                },
                trailing: Button("Uygula") {
                    viewModel.applyFilters()
                    dismiss()
                }
            )
        }
    }
} 