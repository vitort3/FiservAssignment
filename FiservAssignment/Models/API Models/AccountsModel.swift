//
//  AccountsModel.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

struct AccountModelResponse: Codable {
    let id: String
    let accountNumber: Int
    let balance: String
    let currencyCode: String
    let accountType: String
    let accountNickname: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountNumber = "account_number"
        case balance
        case currencyCode = "currency_code"
        case accountType = "account_type"
        case accountNickname = "account_nickname"
    }
    
}

