//
//  InfoBookingItem.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import SwiftUI

struct InfoBookingItem: View {
    let leftText: String
    let rightText: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            HStack {
                Text(leftText)
                    .foregroundColor(Color.theme.grayText)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width / 3)
            
            Text(rightText)
                .foregroundColor(Color.theme.black)
        }
    }
}

struct InfoBookingItem_Previews: PreviewProvider {
    static var previews: some View {
        InfoBookingItem(leftText: "Вылет из", rightText: "Санкт-Петербург")
    }
}
