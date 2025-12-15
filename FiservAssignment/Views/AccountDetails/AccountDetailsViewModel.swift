//
//  AccountDetailsViewModel.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

import Foundation
import UIKit

final class AccountDetailsViewModel {
    enum viewState {
        case loading
        case loaded
        case error(Error)
    }
    
    var onStateChange: ((viewState) -> Void)?
    private let accountService: AccountServiceProtocol
    private let transactionService: TransactionServiceProtocol
    private(set) var transactions: [Transaction] = []
    private(set) var account: Account
    private(set) var accountDetails: AccountDetails?
    var isFavorite: Bool
    
    init(accountService: AccountServiceProtocol = AccountServices.shared, transactionService: TransactionServiceProtocol = TransactionServices.shared, account: Account, isFavorite: Bool = false) {
        self.accountService = accountService
        self.transactionService = transactionService
        self.account = account
        self.isFavorite = isFavorite
    }
    
    func loadAccountDetailsAndTransactions() {
        self.onStateChange?(.loading)
        Task {
            do {
                guard let transactions = try await self.transactionService.fetchTransactions(accountId: self.account.id) else {return}
                guard let accountDetails = try await self.accountService.fetchAccountDetails(accountId: self.account.id) else {return}
                
                self.transactions = transactions
                self.accountDetails = accountDetails
                self.onStateChange?(.loaded)
   
            } catch {
                self.onStateChange?(.error(error))
            }
        }

    }
    
    var numberOfTransactions: Int? {
        return transactions.count
    }

}


