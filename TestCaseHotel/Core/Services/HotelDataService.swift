//
//  HotelDataService.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import Combine
import Foundation

class HotelDataService {
    @Published var hotel: HotelModel = HotelModel(id: 0, name: "", adress: "", minimalPrice: 0, priceForIt: "", rating: 0, ratingName: "", imageUrls: [], aboutTheHotel: AboutTheHotel(description: "", peculiarities: []))
    
    var hotelSubscription: AnyCancellable?
    
    init() {
        getHotel()
    }
    
    private func getHotel() {
        guard let url = URL(string: "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3") else { return }
        
        hotelSubscription = NetworkingManager.download(url: url)
            .decode(type: HotelModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedHotel in
                self?.hotel = returnedHotel
                self?.hotelSubscription?.cancel()
            }
    }
}
