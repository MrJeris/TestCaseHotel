//
//  PriceRowItem.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import SwiftUI

struct PriceRowItem: View {
    let paidFor: String
    let price: String
    var isTotal: Bool = false
    
    var body: some View {
        HStack {
            Text(paidFor)
                .foregroundColor(Color.theme.grayText)
            Spacer()
            Text(price)
                .foregroundColor(isTotal ? Color.theme.blue : Color.theme.black)
                .fontWeight(isTotal ? .semibold : .regular)
        }
    }
}

struct PriceRowItem_Previews: PreviewProvider {
    static var previews: some View {
        PriceRowItem(paidFor: "Тур", price: "186 600 ₽")
    }
}
