//
//  AccountDetailsProtocol.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

import Foundation

protocol TransactionServiceProtocol {
    func fetchTransactions(accountId: String) async throws -> [Transaction]?
}
