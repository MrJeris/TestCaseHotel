//
//  BlockStyle.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import Foundation
import SwiftUI

extension View {
    func blockStyle(corners: UIRectCorner = .allCorners) -> some View {
        self
            .padding(16)
            .background(
                RoundedCorner(radius: 12, corners: corners)
                    .fill(Color.theme.white)
                    .shadow(radius: 0.5)
            )
    }
}
