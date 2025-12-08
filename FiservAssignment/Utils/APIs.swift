//
//  APIs.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

import Foundation

enum APIs: String {
    static let baseURL: String = "http://ktor-env.eba-asssfhm8.eu-west-1.elasticbeanstalk.com/"
    
    case ACCOUNTS = "accounts"
    case ACCOUNT_DETAILS = "account/details/"
    case TRANSACTIONS = "account/transactions/"
    
    var url: URL? {
        return URL(string: APIs.baseURL + self.rawValue)
    }
    
    var urlString: String {
        return APIs.baseURL + self.rawValue
    }
}
