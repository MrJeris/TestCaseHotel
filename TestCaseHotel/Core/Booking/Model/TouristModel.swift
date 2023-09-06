//
//  TouristModel.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 02.09.2023.
//

import Foundation

struct TouristModel: Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var dateOfBirth: String
    var citizenship: String
    var passportNumber: String
    var validityPeriodPassport: String
}
