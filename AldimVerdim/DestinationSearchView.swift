//
//  DestinationSearchView.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 15.07.2024.
//

import SwiftUI

enum DestinationSearchOtions {
    case price
    case km
    case year
    case gear
    case fuel
}

struct DestinationSearchView: View {
    
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOptions: DestinationSearchOtions = .price
    @State private var isAutomatic = false
    @State private var isManual = false
    @State private var isDiesel = false
    @State private var isGasolene = false
    @State private var isElectric = false
    @State private var isHybrit = false
    

    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                }
                Spacer()
                if !destination.isEmpty {
                    Button("Temizle") {
                        destination = ""
                    }
                    .font(.callout)
                    .fontWeight(.semibold)
                }
                
            }
            .padding()
            VStack(alignment: .leading) {
                if (selectedOptions == .price) {
                    Text("Fiyat")
                        .fontWeight(.semibold)
                    HStack {
                        TextField("Min fiyat", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                        TextField("Max fiyat", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                    }
                } else {
                    ExtractedView(title: "Hangi fiyat", description: "Fiyat ekle")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOptions = .price}
            }
            
            VStack (alignment: .leading) {
                if selectedOptions == .year {
                    Text("Yıl")
                        .fontWeight(.semibold)
                    HStack {
                        TextField("Min yıl", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                        TextField("Max yıl", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                    }
                    
                } else {
                    ExtractedView(title: "Hangi yıl", description: "Yıl ekle")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOptions = .year}
            }
            
            VStack(alignment: .leading) {
                if (selectedOptions == .km) {
                    Text("Km")
                        .fontWeight(.semibold)
                    HStack {
                        TextField("Min km", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                        TextField("Max km", text: $destination)
                            .frame(height: 40)
                            .padding(.horizontal)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(Color(.systemGray2))
                            }
                    }
                } else {
                    ExtractedView(title: "Hangi km", description: "Km ekle")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOptions = .km}
            }
            VStack(alignment: .leading) {
                if (selectedOptions == .gear) {
                    Text("Vites")
                        .fontWeight(.semibold)
                    
                        Toggle(isOn: $isAutomatic) {
                           Text("Otomatik Vites")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .padding()

                        Toggle(isOn: $isManual) {
                            Text("Manuel Vites")
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .padding()
                    
                    
                } else {
                    ExtractedView(title: "Hangi vites", description: "Vites Ekle")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOptions = .gear}
            }
            
            VStack(alignment: .leading) {
                if (selectedOptions == .fuel) {
                    Text("Yakıt")
                        .fontWeight(.semibold)
                    
                    Toggle(isOn: $isDiesel) {
                        Text("Dizel")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .padding()

                    Toggle(isOn: $isGasolene) {
                        Text("Benzin")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .padding()
                    
                    Toggle(isOn: $isElectric) {
                       Text("Elektrik")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .padding()

                    Toggle(isOn: $isHybrit) {
                        Text("Hibrit")
                    }
                    .toggleStyle(CheckboxToggleStyle())
                    .padding()
                    
                    
                } else {
                    ExtractedView(title: "Hangi yakıt", description: "Yakıt Ekle")
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .onTapGesture {
                withAnimation(.snappy) {selectedOptions = .fuel}
            }
            
            Spacer()
            
            
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
        
    }
}

struct ExtractedView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                
                Text(description)
                    .fontWeight(.semibold)
            }
            
        }
        
        
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                
            configuration.label
               Spacer()
        }
        
    }
}
