//
//  FilterSheet.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 25.12.2024.
//

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

struct KMRangeSlider: View {
    @Binding var range: ClosedRange<Int> // Örnek: 0...200000
    
    var body: some View {
        VStack {
            Text("\(range.lowerBound) km - \(range.upperBound) km")
            
            // Alt sınır Slider'ı
            Slider(
                value: Binding(
                    get: { Double(range.lowerBound) },
                    set: { range = Int($0)...range.upperBound }
                ),
                in: 0...300000,
                step: 1000
            )
            
            // Üst sınır Slider'ı
            Slider(
                value: Binding(
                    get: { Double(range.upperBound) },
                    set: { range = range.lowerBound...Int($0) }
                ),
                in: 0...300000,
                step: 1000
            )
        }
    }
}


struct YearRangePicker: View {
    @Binding var range: ClosedRange<Int> // Örnek: 2010...2023
    
    var body: some View {
        VStack {
            Text("\(range.lowerBound) - \(range.upperBound)")
            Stepper("Başlangıç Yılı: \(range.lowerBound)", value: Binding(
                get: { range.lowerBound },
                set: { range = $0...range.upperBound }
            ), in: 1980...2025)
            Stepper("Bitiş Yılı: \(range.upperBound)", value: Binding(
                get: { range.upperBound },
                set: { range = range.lowerBound...$0 }
            ), in: 1980...2025)
        }
    }
}

struct PriceRangeSlider: View {
    @Binding var range: ClosedRange<Double> // Örnek: 10000...50000
    
    var body: some View {
        VStack {
            Text("₺\(Int(range.lowerBound)) - ₺\(Int(range.upperBound))")
            Slider(value: Binding(
                get: { range.lowerBound },
                set: { range = $0...range.upperBound }
            ), in: 0...100000, step: 1000)
            Slider(value: Binding(
                get: { range.upperBound },
                set: { range = range.lowerBound...$0 }
            ), in: 0...100000, step: 1000)
        }
    }
}
