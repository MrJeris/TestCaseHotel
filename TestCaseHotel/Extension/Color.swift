//
//  Color.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 30.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let black = Color("BlackColor")
    let blue = Color("BlueColor")
    let grayBackground = Color("GrayBackgroundColor")
    let grayText = Color("GrayTextColor")
    let grayBackgroundScrollColor = Color("GrayBackgroundScrollColor")
    let orangeBackground = Color("OrangeBackgroundColor")
    let orangeText = Color("OrangeTextColor")
    let white = Color("WhiteColor")
    let errorValidation = Color("ErrorValidation")
}

