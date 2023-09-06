//
//  CustomTextFieldView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 04.09.2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    @Binding var text: String
    let placeholder: String
    
    var isValidText: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text(placeholder)
                .foregroundColor(Color.theme.grayText)
                .offset(x: 16, y: text.isEmpty ? 16 : 10)
                .font(text.isEmpty ? .callout : .caption)
            
            TextField("", text: $text)
                .foregroundColor(Color.theme.black)
                .padding(16)
                .font(.callout)
                .offset(y: text.isEmpty ? 0 : 6)
        }
        .animation(.easeInOut(duration: 0.1), value: text)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isValidText ? .clear : Color.theme.errorValidation.opacity(0.15))
        )
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.grayBackground)
        )
        .animation(.linear(duration: 0.2), value: text)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant(""), placeholder: "Имя", isValidText: false)
    }
}
