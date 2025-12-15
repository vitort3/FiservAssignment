//
//  UserDefaultsTests.swift
//  FiservAssignment
//
//  Created by Vitor Augusto Silva on 15/12/25.
//

import XCTest
@testable import FiservAssignment

@MainActor
final class UserDefaultsTests: XCTestCase {
    
    private var userDefaults: UserDefaults!
    private var manager: UserDefaultsManager!

    override func setUpWithError() throws {
        userDefaults = UserDefaults(suiteName: "UserDefaultsTests")!
        userDefaults.removePersistentDomain(forName: "UserDefaultsTests")
        manager = UserDefaultsManager(userDefaults: userDefaults)
    }

    func testAddFavoriteAccount() {
        manager.addFavoriteAccount(id: "abc")
        let favorites = manager.getFavoriteAccounts()
        XCTAssertTrue(favorites.contains("abc"))
    }

    func testRemoveFavoriteAccount() {
        manager.addFavoriteAccount(id: "abc")
        manager.removeFavoriteAccount(id: "abc")
        let favorites = manager.getFavoriteAccounts()
        XCTAssertFalse(favorites.contains("abc"))
    }

    func testIsFavorite() {
        manager.addFavoriteAccount(id: "abc")
        XCTAssertTrue(manager.isFavorite(accountId: "abc"))
        XCTAssertFalse(manager.isFavorite(accountId: "xyz"))
    }

    func testToggleFavorite_addsAndRemoves() {
        manager.toggleFavorite(accountId: "abc")
        XCTAssertTrue(manager.isFavorite(accountId: "abc"))
        manager.toggleFavorite(accountId: "abc")
        XCTAssertFalse(manager.isFavorite(accountId: "abc"))
    }

    func testClearAllFavorites() {
        manager.addFavoriteAccount(id: "abc")
        manager.addFavoriteAccount(id: "def")
        manager.clearAllFavorites()
        let favorites = manager.getFavoriteAccounts()
        XCTAssertEqual(favorites.count, 0)
    }
}

