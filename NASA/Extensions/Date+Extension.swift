//
//  Date+Extension.swift
//  NASA
//
//  Created by Mahmoud Salaheldin on 16/04/2022.
//

import Foundation

extension Date {
    
    static func changeDaysBy(days : Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
    
     func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
