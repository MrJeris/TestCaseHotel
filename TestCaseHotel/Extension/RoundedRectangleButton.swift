//
//  RoundedRectangleButton.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import Foundation
import SwiftUI

extension View {
    func roundedRectangleButton(colorText: Color, cornerRadius: CGFloat = 15, fillColor: Color, paddingHorizontal: CGFloat = 32) -> some View {
        self
            .foregroundColor(colorText)
            .frame(width: UIScreen.main.bounds.width - paddingHorizontal, height: 54)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fillColor)
            )
    }
}
