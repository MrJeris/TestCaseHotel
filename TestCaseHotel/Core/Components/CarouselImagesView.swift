//
//  CarouselImagesView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import SwiftUI

struct CarouselImagesView: View {
//    @StateObject var vm: CarouselImagesViewModel
//
//    init(hotel: HotelModel) {
//        _vm = StateObject(wrappedValue: CarouselImagesViewModel(hotel: hotel))
//    }
    let urlsImage: [String]
    
    var body: some View {
        TabView {
            ForEach(urlsImage, id: \.self) { imageUrl in
                AsyncImage(url: URL(string: imageUrl)) { phase in
                    switch phase {
                    case .empty: ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(1.3, contentMode: .fill)
                    case .failure:
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundColor(Color.theme.black)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .aspectRatio(1.3, contentMode: .fill)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct CarouselImagesView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselImagesView(urlsImage: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"])
    }
}
