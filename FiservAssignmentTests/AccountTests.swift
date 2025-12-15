//
//  FiservAssignmentTests.swift
//  FiservAssignmentTests
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

import XCTest
@testable import FiservAssignment

@MainActor
final class AccountTests: XCTestCase {
    
    private var sut: AccountListViewModel!
    private var service: AccountListServiceMock!
    
    override func setUp() {
        super.setUp()
        service = AccountListServiceMock()
        sut = AccountListViewModel(service: service)
    }
    
    func testInitialStatus() {
        XCTAssertEqual(sut.accounts.count, 0)
    }
    
    @MainActor
    func testFetchItemsSuccess() async {
        let expectation = XCTestExpectation(description: "State loaded emitted")
        service.resultAccount = .success(Account.getMockAccountList())
        sut.onStateChange = { state in
            if case .loaded = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccounts()
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertNotEqual(sut.numberOfAccounts, 0)
    }
    
    func testFetchItemsError() async {
        service.resultAccount = .failure(APIErrors.serverError(statusCode: 404))
        let expectation = XCTestExpectation(description: "State loaded emitted")
        sut.onStateChange = { state in
            if case .error(_) = state {
                expectation.fulfill()
            }
        }
        
        sut.loadAccounts()
        await fulfillment(of: [expectation], timeout: 1.0)
        XCTAssertEqual(sut.numberOfAccounts, 0)
    }
    
    func testGetAccountSuccess() async {
        let expectation = expectation(description: "Loaded")
        let accountTest = Account(id: Constants.idTest,
                                  accountNumber: 66,
                                  balance: "500.00",
                                  currencyCode: "BRL",
                                  accountType: "current",
                                  accountNickname: "Minha Conta")
        
        service.resultAccount = .success([accountTest])

        sut.onStateChange = { state in
            if case .loaded = state {
                expectation.fulfill()
            }
        }

        sut.loadAccounts()
        await fulfillment(of: [expectation], timeout: 1)

        let result = sut.getAccount(at: IndexPath(row: 0, section: 0))

        XCTAssertEqual(result.id, Constants.idTest)
    }
    
    
    func testAccountsModelMock()  {
        let accounts = Account.getMockAccountList()
        XCTAssert(!accounts.isEmpty)
    }
    
    func testEmptyAccountModelMock() {
        let accounts = Account.getEmptyMockAccountList()
        XCTAssert(accounts.isEmpty)
    }
 
}
