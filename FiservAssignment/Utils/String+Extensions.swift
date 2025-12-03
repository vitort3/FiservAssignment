//
//  Date+Extensions.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//
import Foundation

extension Date{
    func convertStringToDate(dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
    
}
