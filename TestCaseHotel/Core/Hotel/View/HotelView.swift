//
//  HotelView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 30.08.2023.
//

import SwiftUI
import WrappingHStack

struct HotelView: View {
    @StateObject private var vm = HotelViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.grayBackgroundScrollColor
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    //1 section
                    VStack(alignment: .leading, spacing: 16) {
                        carouselImage
                        
                        basicInfoAboutHotel
                        
                        price
                    }
                    .blockStyle(corners: [.bottomLeft, .bottomRight])
                    
                    //2 section
                    VStack(alignment: .leading, spacing: 16) {
                        detailInfoAboutHotel
                        
                        attributesHotel
                    }
                    .blockStyle()
                    .padding(.bottom, 12)
                }
            }
            //Кнопка "К выбору номера"
            .safeAreaInset(edge: .bottom) {
                choosingPlaceButton
            }
            .scrollViewModificators()
        }
        .navigationTitle("Отель")
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HotelView()
        }
    }
}




extension HotelView {
    var carouselImage: some View {
        CarouselImagesView(urlsImage: vm.hotel.imageUrls)
    }

    var basicInfoAboutHotel: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                Text("\(vm.hotel.rating) \(vm.hotel.ratingName)")
            }
            .roundedRectangleBackground(colorText: Color.theme.orangeText, fillColor: Color.theme.orangeBackground.opacity(0.2))

            Text(vm.hotel.name)
                .titleTextStyle()

            Text(vm.hotel.adress)
                .addressTextStyle()
        }
    }

    var price: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text("От \(vm.hotel.minimalPrice.currentFormatterRub()) ₽")
                .priceTextStyle()

            Text(vm.hotel.priceForIt)
                .foregroundColor(Color.theme.grayText)
                .defaultTextStyle()
        }
    }

    var detailInfoAboutHotel: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Об отеле")
                .titleTextStyle()

            VStack(alignment: .leading, spacing: 12) {
                WrappingHStack(vm.hotel.aboutTheHotel.peculiarities, id: \.self, spacing: .constant(8), lineSpacing: 8) { item in
                    Text(item)
                        .roundedRectangleBackground()
                }

                Text(vm.hotel.aboutTheHotel.description)
                    .foregroundColor(Color.theme.black)
            }
        }
    }

    var attributesHotel: some View {
        VStack {
            AboutHotelListItem(text: "Удобства", imageName: "emoji_happy")
            AboutHotelListItem(text: "Что включено", imageName: "tick_square")
            AboutHotelListItem(text: "Что не включено", imageName: "close_square", isLastItem: true)
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.theme.grayBackground)
        )
    }

    var choosingPlaceButton: some View {
        VStack(spacing: 12) {
            Divider()

            NavigationLink {
                RoomView(title: vm.hotel.name)
            } label: {
                Text("К выбору номера")
                    .roundedRectangleButton(
                        colorText: Color.theme.white,
                        fillColor: Color.theme.blue
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.theme.white)
    }
}
