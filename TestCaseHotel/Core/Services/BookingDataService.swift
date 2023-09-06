//
//  BookingDataService.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 02.09.2023.
//

import Combine
import Foundation

class BookingDataService {
    @Published var booking: BookingModel = BookingModel(id: 0, hotelName: "", hotelAdress: "", horating: 0, ratingName: "", departure: "", arrivalCountry: "", tourDateStart: "", tourDateStop: "", numberOfNights: 0, room: "", nutrition: "", tourPrice: 0, fuelCharge: 0, serviceCharge: 0)
    
    var bookingSubscription: AnyCancellable?
    
    init() {
        getBooking()
    }
    
    private func getBooking() {
        guard let url = URL(string: "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8") else { return }
        
        bookingSubscription = NetworkingManager.download(url: url)
            .decode(type: BookingModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion) { [weak self] returnedBooking in
                self?.booking = returnedBooking
                self?.bookingSubscription?.cancel()
            }
    }
}
