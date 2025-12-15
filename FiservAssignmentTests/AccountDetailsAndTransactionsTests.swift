//
//  AccountDetailsTest.swift
//  FiservAssignment
//
//  Created by Vitor Augusto Silva on 15/12/25.

import XCTest
@testable import FiservAssignment


@MainActor
final class AccountDetailsAndTransactionsTests: XCTestCase {
    
    private var sut: AccountDetailsViewModel!
    private var service: AccountListServiceMock!
    private var transactionService: TransactionServiceMock!
    private let accountTest = Account(id: Constants.idTest,
                                      accountNumber: 66,
                                      balance: "500.00",
                                      currencyCode: "BRL",
                                      accountType: "current",
                                      accountNickname: "Minha Conta")
    
    override func setUp() {
        super.setUp()
        service = AccountListServiceMock()
        transactionService = TransactionServiceMock()
        sut = AccountDetailsViewModel(accountService: service, transactionService: transactionService, account: accountTest)
    }
    
    func testAccountDetailSuccess() async {
        let expectation = expectation(description: "Loaded")
        
        let accountDetailsTest = AccountDetails(productName: "Current Account EUR",
                                                openedDate: "2025-11-23T10:15:30Z",
                                                branch: "Main Branch",
                                                beneficiaries: ["John Doe"])
        
        service.resultAccountDetails = .success(accountDetailsTest)
        transactionService.resultTransactions = .success(Transaction.getTransactionsMock())
        
        sut.onStateChange = { state in
            if case .loaded = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccountDetailsAndTransactions()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertNotNil(sut.accountDetails)
    }
    
    func testTransactionsSuccess() async {
        let expectation = expectation(description: "Loaded")
        
        let accountDetailsTest = AccountDetails(productName: "Current Account EUR",
                                                openedDate: "2025-11-23T10:15:30Z",
                                                branch: "Main Branch",
                                                beneficiaries: ["John Doe"])
        
        service.resultAccountDetails = .success(accountDetailsTest)
        transactionService.resultTransactions = .success(Transaction.getTransactionsMock() )
        
        sut.onStateChange = { state in
            if case .loaded = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccountDetailsAndTransactions()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertFalse(sut.transactions.isEmpty)
    }
    
    func testAccountDetailsError() async {
        let expectation = expectation(description: "Loaded")
        
        service.resultAccountDetails = .failure(APIErrors.noData)
        transactionService.resultTransactions = .failure(APIErrors.noData)
        
        sut.onStateChange = { state in
            if case .error(_) = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccountDetailsAndTransactions()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertNil(sut.accountDetails)
        
    }
    
    func testTransactionsError() async {
        let expectation = expectation(description: "Loaded")
        
        service.resultAccountDetails = .failure(APIErrors.noData)
        transactionService.resultTransactions = .failure(APIErrors.noData)
        
        sut.onStateChange = { state in
            if case .error(_) = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccountDetailsAndTransactions()
        
        await fulfillment(of: [expectation], timeout: 1)
        
        XCTAssertEqual(sut.numberOfTransactions, 0)
        
    }
    
    func testTransactionsMock() {
        XCTAssertNotNil(Transaction.getTransactionsMock())
    }
    
    func testEmptyTransactionsMock() {
        XCTAssertNotNil(Transaction.getTransactionsMockEmpty())
    }

}

