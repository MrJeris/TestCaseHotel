//
//  RoundedRectangleBackground.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 30.08.2023.
//

import SwiftUI

struct RoundedRectangleBackground: ViewModifier {
    var colorText: Color = Color.theme.grayText
    var cornerRadius: CGFloat = 5
    var fillColor: Color = Color.theme.grayBackground
    
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(colorText)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(fillColor)
            )
    }
}

extension View {
    func roundedRectangleBackground(colorText: Color = Color.theme.grayText, cornerRadius: CGFloat = 5, fillColor: Color = Color.theme.grayBackground) -> some View {
        modifier(RoundedRectangleBackground(colorText: colorText, cornerRadius: cornerRadius, fillColor: fillColor))
    }
}
