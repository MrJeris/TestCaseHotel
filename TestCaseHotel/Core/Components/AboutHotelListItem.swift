//
//  AboutHotelListItem.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 30.08.2023.
//

import SwiftUI

struct AboutHotelListItem: View {
    let text: String
    let imageName: String
    var isLastItem: Bool = false
    
    var body: some View {
        HStack(alignment: .lastTextBaseline, spacing: 12) {
            Image(imageName)
                .resizable()
                .foregroundColor(.black)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 24)
                .padding(.bottom, 2)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(text)
                            .font(.callout)
                            .foregroundColor(Color.theme.black)
                        
                        Text("Самое необходимое")
                            .font(.footnote)
                            .foregroundColor(Color.theme.grayText)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .foregroundColor(Color.theme.black)
                        .fontWeight(.semibold)
                        .padding(6)
                }
                
                if !isLastItem {
                    Divider()
                }
            }
        }
    }
}

struct AboutHotelListItem_Previews: PreviewProvider {
    static var previews: some View {
        AboutHotelListItem(text: "Удобства", imageName: "emoji_happy")
    }
}
