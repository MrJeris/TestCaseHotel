//
//  ScrollViewModificator.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import Foundation
import SwiftUI

extension View {
    func scrollViewModificators() -> some View {
        self
            .scrollContentBackground(.visible)
            .toolbarBackground(Color.theme.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
    }
}
