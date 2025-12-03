//
//  AccountServiceProtocol.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 02/12/25.
//

import Foundation

protocol AccountServiceProtocol {
    func fetchAccounts() async throws -> [Account]?
    func fetchAccountDetails(accountId: String) async throws -> AccountDetails?
}
