//
//  MutableAttributedString.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 08/12/25.
//

import Foundation

extension NSMutableAttributedString {
    
    convenience init(_ parts: [[String: [NSAttributedString.Key: Any]]]) {
        self.init()
        
        for part in parts {
            for (text, attributes) in part {
                let attributedText = NSAttributedString(string: text, attributes: attributes)
                self.append(attributedText)
            }
        }
    }
}
