//
//  UserDefaultsManager.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 08/12/25.
//
import Foundation

final class UserDefaultsManager {
    
    // MARK: - Singleton
    static let shared = UserDefaultsManager()
    
    // MARK: - Keys
    private enum Keys {
        static let favoriteAccounts = "favoriteAccounts"
    }
    
    // MARK: - Properties
    private let userDefaults: UserDefaults
    
    // MARK: - Initialization
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

extension UserDefaultsManager { //Favorite Account Functions
    func getFavoriteAccounts() -> [String] {
        return userDefaults.stringArray(forKey: Keys.favoriteAccounts) ?? []
    }
    
    func addFavoriteAccount(id: String) {
        var favorites = getFavoriteAccounts()
        
        guard !favorites.contains(id) else { return }
        
        favorites.append(id)
        userDefaults.set(favorites, forKey: Keys.favoriteAccounts)
    }
    
    func removeFavoriteAccount(id: String) {
        var favorites = getFavoriteAccounts()
        favorites.removeAll { $0 == id }
        userDefaults.set(favorites, forKey: Keys.favoriteAccounts)
    }
    
    func isFavorite(accountId: String) -> Bool {
        return getFavoriteAccounts().contains(accountId)
    }
    
    func toggleFavorite(accountId: String) {
        if isFavorite(accountId: accountId) {
            removeFavoriteAccount(id: accountId)
        } else {
            addFavoriteAccount(id: accountId)
        }
    }
    
    func clearAllFavorites() {
        userDefaults.removeObject(forKey: Keys.favoriteAccounts)
    }
}
