//
//  CarouselTabView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import Foundation
import SwiftUI

extension View {
    func carouselTabView(cornerRadius: CGFloat) -> some View {
        self
            .aspectRatio(1.3, contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
