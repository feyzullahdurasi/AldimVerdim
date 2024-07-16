//
//  DeveloperPreview.swift
//  AldimVerdim
//
//  Created by Feyzullah Durası on 16.07.2024.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: "123456723",
            ownerId: "da23u36",
            ownerName: "Ahmet Kaya Oto",
            productName: "BMW 520D",
            mainImageURL: "bmw1_5", 
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw1","bmw1_1", "bmw1_2", "bmw1_3","bmw1_4", "bmw1_5"],
            price: "1.500.000",
            year: "2012",
            km: "120.000",
            automatic: true,
            manual: false,
            diesel: true,
            gasoline: false,
            electric: false,
            hybrit: false,
            address: "arkasokak",
            city: "Balıkesir",
            state: "Karesi",
            title: "Araç tamamen orjinal Hayalet+Vakum Araç tamamen orjinal",
            rating: 4.5,
            features: [.superHost],
            type: .sedan
        ),
        .init(
            id: "124446789",
            ownerId: "da23w56",
            ownerName: "Mehmet Oto",
            productName: "BMW", 
            mainImageURL: "bmw2_2",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw2_","bmw2_1","bmw2_2", "bmw2_3", "bmw2_4","bmw2_5"],
            price: "1.210.000",
            year: "2012",
            km: "170.000",
            automatic: false,
            manual: true,
            diesel: false,
            gasoline: false,
            electric: false,
            hybrit: true,
            address: "arkasokak",
            city: "Ankara",
            state: "Mamak",
            title: "Ağır hasar kaydı vardır ölücüler aramasın",
            rating: 3.9,
            features: [.superHost],
            type: .sedan
        ),
        .init(
            id: "321456789",
            ownerId: "w0s3u36",
            ownerName: "Necati Kaçar",
            productName: "BMW i4",
            mainImageURL: "bmw1_3",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw1","bmw1_1", "bmw1_2", "bmw1_3","bmw1_4", "bmw1_5"],
            price: "1.350.000",
            year: "2011",
            km: "145.000",
            automatic: true,
            manual: false,
            diesel: false,
            gasoline: false,
            electric: true,
            hybrit: false,
            address: "arkasokak",
            city: "İstanbul",
            state: "Tuzla",
            title: "Gelen alır o kadar söylüyorum, ayna bozuktur",
            rating: 3.2,
            features: [.superHost],
            type: .suv
        ),
        .init(
            id: "123456069",
            ownerId: "da2355a",
            ownerName: "Ahmet Yıldız Oto",
            productName: "BMW 530i",
            mainImageURL: "bmw2_1", 
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw2_","bmw2_1","bmw2_2", "bmw2_3", "bmw2_4","bmw2_5"],
            price: "1.850.000",
            year: "2010",
            km: "70.000",
            automatic: false,
            manual: true,
            diesel: false,
            gasoline: true,
            electric: false,
            hybrit: false,
            address: "arkasokak",
            city: "İstanbul",
            state: "Ataşehir",
            title: "kilometresi düşüktür nadir koleksiyonluk araba",
            rating: 4.8,
            features: [.superHost],
            type: .hachback
        ),
        .init(
            id: "763456723",
            ownerId: "da23u36",
            ownerName: "Ahmet Kaya Oto",
            productName: "BMW 520D",
            mainImageURL: "bmw1_5",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw1","bmw1_1", "bmw1_2", "bmw1_3","bmw1_4", "bmw1_5"],
            price: "1.500.000",
            year: "2012",
            km: "120.000",
            automatic: true,
            manual: false,
            diesel: true,
            gasoline: false,
            electric: false,
            hybrit: false,
            address: "arkasokak",
            city: "Balıkesir",
            state: "Karesi",
            title: "Araç tamamen orjinal Hayalet+Vakum Araç tamamen orjinal",
            rating: 4.5,
            features: [.superHost],
            type: .sedan
        ),
        .init(
            id: "444446789",
            ownerId: "da23w56",
            ownerName: "Mehmet Oto",
            productName: "BMW hybrit",
            mainImageURL: "bmw2_",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw2_","bmw2_1","bmw2_2", "bmw2_3", "bmw2_4","bmw2_5"],
            price: "1.210.000",
            year: "2012",
            km: "170.000",
            automatic: false,
            manual: true,
            diesel: false,
            gasoline: false,
            electric: false,
            hybrit: true,
            address: "arkasokak",
            city: "Ankara",
            state: "Mamak",
            title: "Ağır hasar kaydı vardır ölücüler aramasın",
            rating: 4.1,
            features: [.superHost],
            type: .sedan
        ),
        .init(
            id: "321452189",
            ownerId: "w0s3u36",
            ownerName: "kılıçlar",
            productName: "BMW i5",
            mainImageURL: "bmw1_3",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw1","bmw1_1", "bmw1_2", "bmw1_3","bmw1_4", "bmw1_5"],
            price: "1.350.000",
            year: "2011",
            km: "145.000",
            automatic: true,
            manual: false,
            diesel: false,
            gasoline: false,
            electric: true,
            hybrit: false,
            address: "arkasokak",
            city: "İstanbul",
            state: "Tuzla",
            title: "Gelen alır o kadar söylüyorum, ayna bozuktur",
            rating: 3.2,
            features: [.superHost],
            type: .suv
        ),
        .init(
            id: "123456700",
            ownerId: "da235ss",
            ownerName: "Yılmaz Oto",
            productName: "BMW",
            mainImageURL: "bmw2_1",
            callNumber: "0535 404 40 40",
            imageURLs: ["bmw2_","bmw2_1","bmw2_2", "bmw2_3", "bmw2_4","bmw2_5"],
            price: "1.850.000",
            year: "2010",
            km: "70.000",
            automatic: false,
            manual: true,
            diesel: false,
            gasoline: true,
            electric: false,
            hybrit: false,
            address: "arkasokak",
            city: "İstanbul",
            state: "Ataşehir",
            title: "kilometresi düşüktür nadir koleksiyonluk araba",
            rating: 4.2,
            features: [.superHost],
            type: .sedan
        )
    ]
}
