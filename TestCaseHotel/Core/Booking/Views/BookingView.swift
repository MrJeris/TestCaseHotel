//
//  BookingView.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 31.08.2023.
//

import SwiftUI

struct BookingView: View {
    
    @StateObject private var vm = BookingViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.grayBackgroundScrollColor
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                aboutHotelBlock
                
                informationTravel
                
                informationBuyer
                
                listTourists
                
                addTourist
                
                totalPriceBlock
            }
            .safeAreaInset(edge: .bottom) {
                payButton
            }
            .disabled(vm.errorMessageShow)
            .ignoresSafeArea(.keyboard)
            .scrollViewModificators()
        }
        .alert("Пожалуйста заполните все обязательные поля", isPresented: $vm.errorMessageShow) {
            Button("Ок", role: .cancel) {}
        }
        .navigationTitle("Бронирование")
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookingView()
        }
    }
}

extension BookingView {
    var aboutHotelBlock: some View {
        //Оценка, название, адрес
        LazyVStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 2) {
                Image(systemName: "star.fill")
                Text("\(vm.booking.horating) \(vm.booking.ratingName)")
            }
            .roundedRectangleBackground(colorText: Color.theme.orangeText, fillColor: Color.theme.orangeBackground.opacity(0.2))
            
            Text(vm.booking.hotelName)
                .titleTextStyle()
            
            Text(vm.booking.hotelAdress)
                .addressTextStyle()
        }
        .blockStyle()
        .padding(.top, 8)
    }
    
    var informationTravel: some View {
        //Информация о поездке (вылет из...)
        LazyVStack(alignment: .leading, spacing: 16) {
            InfoBookingItem(leftText: "Вылет из", rightText: vm.booking.departure)
            InfoBookingItem(leftText: "Страна, город", rightText: vm.booking.arrivalCountry)
            InfoBookingItem(leftText: "Даты", rightText: "\(vm.booking.tourDateStart) - \(vm.booking.tourDateStop)")
            InfoBookingItem(leftText: "Кол-во ночей", rightText: "\(vm.booking.numberOfNights) ночей")
            InfoBookingItem(leftText: "Отель", rightText: vm.booking.hotelName)
            InfoBookingItem(leftText: "Номер", rightText: vm.booking.room)
            InfoBookingItem(leftText: "Питание", rightText: vm.booking.nutrition)
        }
        .blockStyle()
    }
    
    var informationBuyer: some View {
        //Информация о покупателе
        VStack(alignment: .leading, spacing: 20) {
            Text("Информация о покупателе")
                .titleTextStyle()
            
            VStack(alignment: .leading, spacing: 8) {
                //Номер телефона
                VStack(alignment: .leading, spacing: 0) {
                    Text("Номер телефона")
                        .font(.caption)
                        .foregroundColor(Color.theme.grayText)
                    
                    TextField("Номер телефона", text: $vm.phoneNumber)
                        .onTapGesture {
                            vm.phoneNumber = "7"
                        }
                        .onChange(of: vm.phoneNumber) { _ in
                            vm.formatPhoneNumber()
                        }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.theme.grayBackground)
                )
                
                CustomTextFieldView(text: $vm.email, placeholder: "Почта", isValidText: vm.isEmailValid)
                    .keyboardType(.emailAddress)
                
                Text("Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.grayText)
            }
        }
        .blockStyle()
    }
    
    var listTourists: some View {
        ForEach($vm.tourists) { $tourist in
            TouristBlock(tourist: $tourist, isValidTouristFields: vm.isValidTouristFields)
        }
    }
    
    var addTourist: some View {
        //Добавить туриста
        LazyVStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Добавить туриста")
                    .titleTextStyle()
                
                Spacer()
                
                Button {
                    withAnimation(.spring()) {
                        vm.addTourist()
                    }
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.theme.white)
                        .fontWeight(.bold)
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .fill(Color.theme.blue)
                        )
                }
            }
        }
        .blockStyle()
    }
    
    var payButton: some View {
        VStack(spacing: 12) {
            Divider()
            
            NavigationLink(destination: OrderPaidView(), isActive: $vm.allFieldValid) {
                Button {
                    vm.validationAllField()
                } label: {
                    Text("Оплатить \(vm.totalPrice) ₽")
                        .fontWeight(.semibold)
                        .roundedRectangleButton(
                            colorText: Color.theme.white,
                            fillColor: Color.theme.blue
                        )
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.theme.white)
    }
    
    var totalPriceBlock: some View {
        LazyVStack(spacing: 16) {
            PriceRowItem(paidFor: "Тур", price: "\(vm.booking.tourPrice.currentFormatterRub()) ₽")
            PriceRowItem(paidFor: "Топливный сбор", price: "\(vm.booking.fuelCharge.currentFormatterRub()) ₽")
            PriceRowItem(paidFor: "Сервисный сбор", price: "\(vm.booking.serviceCharge) ₽")
            PriceRowItem(paidFor: "К оплате", price: "\(vm.totalPrice) ₽", isTotal: true)
        }
        .blockStyle()
    }
}
