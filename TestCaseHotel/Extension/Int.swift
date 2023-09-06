//
//  Int.swift
//  TestCaseHotel
//
//  Created by Ruslan Magomedov on 01.09.2023.
//

import Foundation

extension Int {
    func currentFormatterRub() -> String {
        let number = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "ru_RU")
        
        return formatter.string(from: number) ?? "0"
    }
    
    func russianOrdinal() -> String {
        let odrinalRussian: [Int: String] = [1: "Первый",
                                             2: "Второй",
                                             3: "Третий",
                                             4: "Четвёртый",
                                             5: "Пятый",
                                             6: "Шестой",
                                             7: "Седьмой",
                                             8: "Восьмой",
                                             9: "Девятый",
                                             10: "Десятый",
                                             11: "Одиннадцатый",
                                             12: "Двенадцатый",
                                             13: "Тринадцатый",
                                             14: "Четырнадцатый",
                                             15: "Пятнадцатый",
                                             16: "Шестнадцатый",
                                             17: "Семнадцатый",
                                             18: "Восемнадцатый",
                                             19: "Девятнадцатый",
                                             20: "Двадцатый"]
        
        if let word = odrinalRussian[self] {
            return word
        } else {
            return "\(self)-й"
        }
    }
}
