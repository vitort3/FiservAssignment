//
//  TransactionModel.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

struct TransactionsModelResponse: Codable {
    let transactions: [TransactionModelResponse]
}

struct TransactionModelResponse: Codable {
    let id: String
    let date: String
    let transactionAmount: Double
    let transactionType: String
    let description: String
    let isDebit: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case transactionAmount = "transaction_amount"
        case transactionType = "transaction_type"
        case description
        case isDebit = "is_debit"
    }
}


