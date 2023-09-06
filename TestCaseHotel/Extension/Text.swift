//
//  Text.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import Foundation
import SwiftUI

extension Text {
    func titleTextStyle() -> some View {
        self
            .font(.title2)
            .foregroundColor(Color.theme.black)
            .fontWeight(.medium)
    }
    
    func addressTextStyle() -> some View {
        self
            .font(.footnote)
            .foregroundColor(.blue)
    }
    
    func priceTextStyle() -> some View {
        self
            .font(.title)
            .foregroundColor(Color.theme.black)
            .fontWeight(.semibold)
    }
    
    func defaultTextStyle() -> some View {
        self
            .font(.callout)
    }
}
