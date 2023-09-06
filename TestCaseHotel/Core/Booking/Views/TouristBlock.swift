//
//  TouristBlock.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 02.09.2023.
//

import SwiftUI

struct TouristBlock: View {
    @State var isShowTourist: Bool = false
    @Binding var tourist: TouristModel
    var isValidTouristFields: [Int:[TouristField:Bool]]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("\(tourist.id.russianOrdinal()) турист")
                    .titleTextStyle()
                
                Spacer()
                
                Button {
                    withAnimation(.spring()) {
                        isShowTourist.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.up")
                        .rotationEffect(Angle(degrees: isShowTourist ? 0 : 180))
                        .foregroundColor(Color.theme.blue)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.theme.blue.opacity(0.1))
                                .aspectRatio(1, contentMode: .fill)
                        )
                }
            }
           
            if isShowTourist {
                VStack(spacing: 8) {
                    CustomTextFieldView(text: $tourist.firstName,
                                        placeholder: "Имя",
                                        isValidText: (isValidTouristFields[tourist.id]?[.firstName] ?? true))
                    
                    CustomTextFieldView(text: $tourist.lastName,
                                        placeholder: "Фамилия",
                                        isValidText: (isValidTouristFields[tourist.id]?[.lastName] ?? true))
                    
                    CustomTextFieldView(text: $tourist.dateOfBirth,
                                        placeholder: "Дата рождения",
                                        isValidText: (isValidTouristFields[tourist.id]?[.dateOfBirth] ?? true))
                    
                    CustomTextFieldView(text: $tourist.citizenship,
                                        placeholder: "Гражданство",
                                        isValidText: (isValidTouristFields[tourist.id]?[.citizenship] ?? true))
                    
                    CustomTextFieldView(text: $tourist.passportNumber,
                                        placeholder: "Номер загранпаспорта",
                                        isValidText: (isValidTouristFields[tourist.id]?[.passportNumber] ?? true))
                    
                    CustomTextFieldView(text: $tourist.validityPeriodPassport,
                                        placeholder: "Срок действия загранпаспорта",
                                        isValidText: (isValidTouristFields[tourist.id]?[.validityPeriodPassport] ?? true))
                }
            }
        }
        .blockStyle()
    }
}

struct TouristBlock_Previews: PreviewProvider {
    static var previews: some View {
        TouristBlock(tourist: .constant(TouristModel(id: 0, firstName: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", validityPeriodPassport: "")), isValidTouristFields: [0:[.firstName:false]])
    }
}
