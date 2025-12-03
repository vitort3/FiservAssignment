//
//  AccountDetailsModel.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

struct AccountDetailsModelResponse: Codable {
    let productName: String
    let openedDate: String
    let branch: String
    let beneficiaries: [String]
    
    enum CodingKeys: String, CodingKey {
        case productName = "product_name"
        case openedDate = "opened_date"
        case branch
        case beneficiaries
    }
}
