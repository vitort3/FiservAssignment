//
//  AccountServices.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//
import Foundation

class AccountServices: AccountServiceProtocol {
    static let shared = AccountServices()
    
    func fetchAccounts() async throws -> [Account]? {
        guard let url = APIs.ACCOUNTS.url else {
            throw APIErrors.invalidURL
        }
        
        let request = ServicesHelper.shared.getRequestWithAuth(forUrl: url, method: .get)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            try ServicesHelper.shared.validadeResponse(response)
            
            let accountsResponse = try JSONDecoder().decode([AccountModelResponse].self, from: data)
            return accountsResponse.map(Account.init)
            
        } catch {
            throw error
        }
    }
    
    func fetchAccountDetails(accountId: String) async throws -> AccountDetails? {
        guard let url = URL(string: APIs.ACCOUNT_DETAILS.urlString + accountId) else {
            throw APIErrors.invalidURL
        }
        
        let request = ServicesHelper.shared.getRequestWithAuth(forUrl: url, method: .get)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            try ServicesHelper.shared.validadeResponse(response)
            
            let accountDetails = try JSONDecoder().decode(AccountDetailsModelResponse.self, from: data)
            return AccountDetails(from: accountDetails)
        } catch {
            print(error) //TODO: Error Handling
        }
        
        return nil
    }
}
