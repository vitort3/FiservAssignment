//
//  Transaction.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

import Foundation


struct Transaction {
    let id: String
    let date: Date
    let transactionAmount: String
    let transactionType: String
    let description: String
    let isDebit: Bool
    
    init (from response: TransactionModelResponse) {
        self.id = response.id
        self.date = response.date.asDate ?? Date()
        self.transactionAmount = response.transactionAmount
        self.transactionType = response.transactionType
        self.description = response.description
        self.isDebit = response.isDebit
        
    }
    
    init(id: String, date: String, transactionAmount: String, transactionType: String, description: String, isDebit: Bool) {
        self.id = id
        self.date = date.asDate ?? Date()
        self.transactionAmount = transactionAmount
        self.transactionType = transactionType
        self.description = description
        self.isDebit = isDebit
        
    }
}
extension Transaction {
    static func getTransactionsMock() async -> [Transaction] {
        try? await Task.sleep(seconds: 2)
        return [Transaction(id: "a1a9e85b-0f21-451b-813f-44ebabff46c9",
                            date: "2018-05-16T10:15:30Z",
                            transactionAmount: "199.21",
                            transactionType: "intrabank",
                            description: "NO_DATA",
                            isDebit: false),
                Transaction(id: "a1a9e85b-0f21-451b-813f-44ebabff46c9",
                            date: "2018-05-16T10:15:30Z",
                            transactionAmount: "199.21",
                            transactionType: "intrabank",
                            description: "NO_DATA",
                            isDebit: false),
                Transaction(id: "a1a9e85b-0f21-451b-813f-44ebabff46c9",
                            date: "2019-05-16T10:15:30Z",
                            transactionAmount: "999.00",
                            transactionType: "intrabank",
                            description: "Apple Store",
                            isDebit: false),
                Transaction(id: "a1a9e85b-0f21-451b-813f-44ebabff46c9",
                            date: "2018-05-16T10:15:30Z",
                            transactionAmount: "199.21",
                            transactionType: "intrabank",
                            description: "NO_DATA",
                            isDebit: false),]
    }
    
    static func getTransactionsMockEmpty() async -> [Transaction] {
        try? await Task.sleep(seconds: 2)
        return []
    }
}
