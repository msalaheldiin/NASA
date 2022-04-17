//
//  Date+Extension.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 16/04/2022.
//

import Foundation

extension Date {

    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    static func changeDaysBy(days : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    
    static func getFormattedDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from:date)
    }
}
