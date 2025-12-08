//
//  TransactionModel.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

struct TransactionListModelResponse: Codable {
    let transactions: [TransactionModelResponse]
    let paging: PagingModelResponse
    
    enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
        case paging
    }
}

struct PagingModelResponse: Codable {
    let pagesCount: Int
    let totalItems: Int
    let currentPage: Int
    
    enum CodingKeys: String, CodingKey {
        case pagesCount = "pages_count"
        case totalItems = "total_items"
        case currentPage = "current_page"
    }
}

struct TransactionModelResponse: Codable {
    let id: String
    let date: String
    let transactionAmount: String
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
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)  ?? "NO_DATA"
        self.date = try container.decodeIfPresent(String.self, forKey: .date)  ?? "NO_DATA"
        self.transactionAmount = try container.decodeIfPresent(String.self, forKey: .transactionAmount)  ?? "NO_DATA"
        self.transactionType = try container.decodeIfPresent(String.self, forKey: .transactionType)  ?? "NO_DATA"
        self.description = try container.decodeIfPresent(String.self, forKey: .description)  ?? "NO_DATA"
        self.isDebit = try container.decodeIfPresent(Bool.self, forKey: .isDebit) ?? false
    }
}


