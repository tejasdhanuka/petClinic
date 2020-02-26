//
//  TimeRangeComparator.swift
//  petClinic
//
//  Created by Tejas, Dhanuka on 2020/02/26.
//  Copyright © 2020 Tejas. All rights reserved.
//

import Foundation

extension Date {
    
    private func dateAt(hours: Int, minutes: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        
        var date_components = calendar.components([NSCalendar.Unit.year, NSCalendar.Unit.month, NSCalendar.Unit.day], from: self)
        date_components.hour = hours
        date_components.minute = minutes
        date_components.second = 0
        
        let newDate = calendar.date(from: date_components)!
        return newDate
    }
    
    func isTimeWithinWorkHours() -> Bool {
        let now = Date()
        let eight_today = now.dateAt(hours: 9, minutes: 00)
        let four_thirty_today = now.dateAt(hours: 18, minutes: 00)
        return (now >= eight_today && now <= four_thirty_today) ? true : false
    }
}
