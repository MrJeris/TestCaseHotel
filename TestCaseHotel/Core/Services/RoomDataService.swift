//
//  RoomDataService.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import Combine
import Foundation

class RoomDataService {
    @Published var rooms = RoomsModel(rooms: [])
    
    var roomSubscription: AnyCancellable?
    
    init() {
        getRooms()
    }
    
    private func getRooms() {
        
        guard let url = URL(string: "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd") else { return }
        
        roomSubscription = NetworkingManager.download(url: url)
            .decode(type: RoomsModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedRooms in
                self?.rooms = returnedRooms
                self?.roomSubscription?.cancel()
            })
    }
}
