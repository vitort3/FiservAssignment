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
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? Constants.noData
        self.accountNumber = try container.decodeIfPresent(Int.self, forKey: .accountNumber) ?? -1
        self.balance = try container.decodeIfPresent(String.self, forKey: .balance) ?? Constants.noData
        self.currencyCode = try container.decodeIfPresent(String.self, forKey: .currencyCode) ?? Constants.noData
        self.accountType = try container.decodeIfPresent(String.self, forKey: .accountType) ?? Constants.noData
        self.accountNickname = try container.decodeIfPresent(String.self, forKey: .accountNickname) ?? Constants.noData
    }
    
}

