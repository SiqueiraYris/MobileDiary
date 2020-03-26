//
//  Date+Extension.swift
//  MobileDiary
//
//  Created by Siqueira on 26/03/20.
//  Copyright © 2020 Siqueira. All rights reserved.
//

import Foundation

extension Date {
    func getCurrentDate() -> String {
        let date = Date()
        let calendar = Calendar.current

        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)

        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        let currentDate = "\(day)/\(month)/\(year) - \(hour):\(minutes):\(seconds)"

        return currentDate
    }
}
