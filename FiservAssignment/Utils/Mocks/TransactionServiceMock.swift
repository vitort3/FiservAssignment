//
//  AccountDetailsServiceMock.swift
//  FiservAssignment
//
//  Created by Vitor Augusto Silva on 15/12/25.
//

final class TransactionServiceMock: TransactionServiceProtocol {
    var resultTransactions: Result<[Transaction], Error>!
    
    func fetchTransactions(accountId: String) async throws -> [Transaction]? {
        switch resultTransactions {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        case .none:
            throw APIErrors.noData
        }
    }
}
