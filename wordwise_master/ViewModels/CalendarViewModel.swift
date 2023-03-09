//
//  CalendarViewModel.swift
//  wordwise_master
//
//  Created by Sabrina Freifeld on 2/14/23.
//

import Foundation


class CalendarViewModel: ObservableObject {
    
    let calendar = Calendar.current
    
    let date = Date()
    
    var range : Range<Int> {
        get {
            calendar.range(of: .day, in: .weekOfMonth, for: date)!
        }
    }
    
    var daysOfMonth: [Int] {
        get {
            Array(range.lowerBound..<range.upperBound)
        }
    }
    
    
    var startDay : Int {
        get {
            range.lowerBound
        }
    }
    
    var endDay : Int {
        get {
            range.upperBound - 1
        }
    }
    
}
