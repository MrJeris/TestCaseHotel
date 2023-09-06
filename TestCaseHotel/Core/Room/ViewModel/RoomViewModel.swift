//
//  RoomViewModel.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import Foundation
import Combine

class RoomViewModel: ObservableObject {
    @Published var rooms = RoomsModel(rooms: [])
    
    private let dataService = RoomDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$rooms
            .sink { [weak self] returnedRooms in
                self?.rooms = returnedRooms
            }
            .store(in: &cancellables)
    }
}
