//
//  AccountListViewModel.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 02/12/25.
//

import Foundation
import UIKit

final class AccountListViewModel {
    enum viewState {
        case loading
        case loaded
        case error(Error)
        case empty
    }
    
    private(set) var accounts: [Account] = []
    var favoriteAccounts: [String]
    var onStateChange: ((viewState) -> Void)?
    
    private let service: AccountServiceProtocol
    var numberOfAccounts: Int {
        accounts.count
    }
    func getAccount(at indexPath: IndexPath) -> Account {
        return self.accounts[indexPath.row]
    }
    
    init(service: AccountServiceProtocol = AccountServices.shared) {
        self.service = service
        self.favoriteAccounts = UserDefaultsManager.shared.getFavoriteAccounts()
    }
    
    func loadAccounts(withMock mock: Bool = false, ) {
        Task {
            onStateChange?(.loading)
            do {
                guard let result = mock ? await Account.getMockAccountList() : try await self.service.fetchAccounts() else {return}
                print(result)
                if result.isEmpty {
                    self.onStateChange?(.empty)
                } else {
                    self.accounts = result
                    self.onStateChange?(.loaded)
                }
            } catch {
                self.onStateChange?(.error(error))
            }
        }
        
    }
    
    
}
