//
//  String+Extensions.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//
import Foundation

extension String {
    
    var asDate: Date? {
        return ISO8601DateFormatter().date(from: self)
    }
    
}
