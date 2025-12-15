//
//  AccountListServiceMock.swift
//  FiservAssignment
//
//  Created by Vitor Augusto Silva on 15/12/25.
//

final class AccountListServiceMock: AccountServiceProtocol {
    var resultAccount: Result<[Account], Error>!
    var resultAccountDetails: Result<AccountDetails, Error>!
    
    func fetchAccounts() async throws -> [Account]? {
        switch resultAccount {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        case .none:
            throw APIErrors.noData
        }
    }
    
    func fetchAccountDetails(accountId: String) async throws -> AccountDetails? {
        switch resultAccountDetails {
        case .success(let success):
            return success
        case .failure(let failure):
            throw failure
        case .none:
            throw APIErrors.noData
        }
    }
}

