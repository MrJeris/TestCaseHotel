//
//  BookingViewModel.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 02.09.2023.
//

import Combine
import Foundation

enum TouristField {
    case firstName
    case lastName
    case dateOfBirth
    case citizenship
    case passportNumber
    case validityPeriodPassport
}

class BookingViewModel: ObservableObject {
    @Published var booking = BookingModel(
        id: 0,
        hotelName: "",
        hotelAdress: "",
        horating: 0,
        ratingName: "",
        departure: "",
        arrivalCountry: "",
        tourDateStart: "",
        tourDateStop: "",
        numberOfNights: 0,
        room: "",
        nutrition: "",
        tourPrice: 0,
        fuelCharge: 0,
        serviceCharge: 0)
    
    @Published var tourists = [TouristModel(
            id: 1,
            firstName: "",
            lastName: "",
            dateOfBirth: "",
            citizenship: "",
            passportNumber: "",
            validityPeriodPassport: ""
        )]
    
    private let dataService = BookingDataService()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var allFieldValid: Bool = false
    @Published var errorMessageShow = false
    
    @Published var isValidTouristFields: [Int: [TouristField: Bool]] = [:]
    
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var isEmailValid: Bool = false
    
    init() {
        addSubscribers()
        addSubscribersEmail()
    }
    
    private func addSubscribers() {
        dataService.$booking
            .sink { [weak self] returnedBooking in
                self?.booking = returnedBooking
            }
            .store(in: &cancellables)
    }
    
    private func addSubscribersEmail() {
        $email
            .debounce(for: .seconds(0.4), scheduler: DispatchQueue.main)
            .map { self.validationEmail($0) }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellables)
    }
    
    private func validationEmail(_ email: String) -> Bool {
            let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailPredicate.evaluate(with: email)
        }
    
    private func addSubscribersTourist() {
        $tourists
            .sink { [weak self] tourists in
                self?.validateTourists(tourists)
            }
            .store(in: &cancellables)
    }
    
    func formatPhoneNumber() {
        // Удаление всех нецифровых символов
        let cleanedPhoneNumber = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        // Ограничение номера телефона до 11 цифр
        guard cleanedPhoneNumber.count <= 11 else {
            phoneNumber = String(cleanedPhoneNumber.prefix(11))
            return
        }

        // Применение маски
        var formattedPhoneNumber = "+"
        for (index, digit) in cleanedPhoneNumber.enumerated() {
            if index == 1 {
                formattedPhoneNumber.append(" (")
            } else if index == 4 {
                formattedPhoneNumber.append(") ")
            } else if index == 7 || index == 9 {
                formattedPhoneNumber.append("-")
            }
            formattedPhoneNumber.append(digit)
        }

        // Обновление значения поля ввода
        phoneNumber = formattedPhoneNumber
    }
    
    private func validateTourists(_ tourists: [TouristModel]) {
        for tourist in tourists {
            var touristError: [TouristField: Bool] = [:]
            
            touristError[.firstName] = tourist.firstName.isEmpty ? false : true
            touristError[.lastName] = tourist.lastName.isEmpty ? false : true
            touristError[.dateOfBirth] = tourist.dateOfBirth.isEmpty ? false : true
            touristError[.citizenship] = tourist.citizenship.isEmpty ? false : true
            touristError[.passportNumber] = tourist.passportNumber.isEmpty ? false : true
            touristError[.validityPeriodPassport] = tourist.validityPeriodPassport.isEmpty ? false : true
            
            isValidTouristFields[tourist.id] = touristError
        }
    }
    
    func validationAllField() {
        allFieldValid = tourists.allSatisfy { tourist in
            !tourist.firstName.isEmpty && !tourist.lastName.isEmpty && !tourist.dateOfBirth.isEmpty &&
            !tourist.citizenship.isEmpty && !tourist.passportNumber.isEmpty &&
            !tourist.validityPeriodPassport.isEmpty && isEmailValid
        }
        
        if !allFieldValid {
            errorMessageShow = true
            addSubscribersTourist()
        }
    }
    
    var totalPrice: String {
        (booking.tourPrice + booking.fuelCharge + booking.serviceCharge).currentFormatterRub()
    }
    
    func addTourist() {
        tourists.append(TouristModel(id: tourists.count + 1, firstName: "", lastName: "", dateOfBirth: "", citizenship: "", passportNumber: "", validityPeriodPassport: ""))
    }
}
