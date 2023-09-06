//
//  OrderPaidView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import SwiftUI

struct OrderPaidView: View {    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Image("party_popper")
                .padding(26)
                .background(
                    Circle()
                        .foregroundColor(Color.theme.grayBackground)
                )
            
            Text("Ваш заказ принят в работу")
                .titleTextStyle()
                .padding(.top, 32)
                .padding(.bottom, 20)
            
            Text("Потверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придёт уведомление.")
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .foregroundColor(Color.theme.grayText)
            
            Spacer()
        }
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 12) {
                Divider()
                NavigationLink {
                    HotelView().navigationBarBackButtonHidden(true)
                } label: {
                    Text("Супер!")
                        .roundedRectangleButton(
                            colorText: Color.theme.white,
                            fillColor: Color.theme.blue
                        )
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.theme.white)
        }
        .navigationTitle("Заказ оплачен")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderPaidView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderPaidView()
        }
    }
}
