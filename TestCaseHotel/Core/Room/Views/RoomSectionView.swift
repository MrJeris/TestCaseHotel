//
//  RoomSectionView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import SwiftUI
import WrappingHStack

struct RoomSectionView: View {
    let items = ["Все включено", "Кондиционер"]
    
    let itemRoom: Room
    
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 16) {
            aboutHotel
            
            price
            
            chooseRoom
        }
        .blockStyle()
        .padding(.top, 8)
    }
}

struct RoomSectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RoomSectionView(itemRoom: Room(id: 0, name: "", price: 0, pricePer: "", peculiarities: [], imageUrls: []))
        }
    }
}

extension RoomSectionView {
    private var carouselImage: some View {
        CarouselImagesView(urlsImage: itemRoom.imageUrls)
    }
    
    
    //Карусель + Название + теги
    private var aboutHotel: some View {
        VStack(alignment: .leading, spacing: 8) {
            carouselImage
            
            Text(itemRoom.name)
                .titleTextStyle()
            
            WrappingHStack(itemRoom.peculiarities, id: \.self, spacing: .constant(8), lineSpacing: 8) { item in
                Text(item)
                    .roundedRectangleBackground()
            }
            
            Button {
                //
            } label: {
                HStack(spacing: 12) {
                    Text("Подробнее о номере")
                    Image(systemName: "chevron.forward")
                }
            }
            .roundedRectangleBackground(
                colorText: Color.theme.blue,
                fillColor: Color.theme.blue.opacity(0.1)
            )
        }
    }
    
    private var price: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text("\(itemRoom.price.currentFormatterRub()) ₽")
                .priceTextStyle()
            
            Text(itemRoom.pricePer)
                .foregroundColor(Color.theme.grayText)
                .defaultTextStyle()
        }
    }
    
    private var chooseRoom: some View {
        NavigationLink {
            BookingView()
        } label: {
            Text("Выбрать номер")
                .roundedRectangleButton(colorText: Color.theme.white, fillColor: Color.theme.blue)
        }
        .frame(maxWidth: .infinity)
        .background(Color.theme.white)
    }
}
