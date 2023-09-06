//
//  HotelViewModel.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import Foundation
import Combine

class HotelViewModel: ObservableObject {
    @Published var hotel: HotelModel = HotelModel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))
    
    private let dataService = HotelDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$hotel
            .sink { [weak self] returnedHotel in
                self?.hotel = returnedHotel
            }
            .store(in: &cancellables)
    }
}
