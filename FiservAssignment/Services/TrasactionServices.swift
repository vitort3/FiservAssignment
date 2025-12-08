//
//  TransactionServies.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

import Foundation

class TransactionServices: TransactionServiceProtocol {
    static let shared = TransactionServices()
    
    func fetchTransactions(accountId: String) async throws -> [Transaction]? {
        guard let url = URL(string:APIs.TRANSACTIONS.urlString + accountId) else {
            throw APIErrors.invalidURL
        }
        
        let request = ServicesHelper.shared.getRequestWithAuth(forUrl: url, method: .post)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            try ServicesHelper.shared.validadeResponse(response)
            //TODO: Handle Paging
            let transactionList = try JSONDecoder().decode(TransactionListModelResponse.self, from: data)
            return transactionList.transactions.map(Transaction.init)
            
        } catch {
            print(error) //TODO: Error Handling
        }
        
        return nil
    }
    

}
    
