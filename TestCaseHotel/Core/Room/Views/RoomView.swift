//
//  RoomView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import SwiftUI
import WrappingHStack

struct RoomView: View {
    let title: String
    
    @StateObject private var vm = RoomViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.grayBackgroundScrollColor
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                ForEach(vm.rooms.rooms, id: \.id) { roomItem in
                    RoomSectionView(itemRoom: roomItem)
                }
            }
            .scrollViewModificators()
        }
        .navigationTitle(title)
    }
}

struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomView(title: "Лучший пятизвездочный отель в Хургаде, Египет")
        }
    }
}
