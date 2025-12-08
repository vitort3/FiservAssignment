//
//  Account.swift
//  FiservChallenge
//
//  Created by vitoraugusto.dearaujosilva on 01/12/25.
//

struct Account: Codable {
    let id: String
    let accountNumber: Int
    let balance: String
    let currencyCode: String
    let accountType: String
    let accountNickname: String
    
    init(from response: AccountModelResponse ) {
        id = response.id
        accountNumber = response.accountNumber
        balance = response.balance //No Need to convert to Double or Decimal - no math involved
        currencyCode = response.currencyCode
        accountType = response.accountType
        accountNickname = response.accountNickname
        
    }
    
    init(id: String, accountNumber: Int, balance: String, currencyCode: String, accountType: String, accountNickname: String) {
        self.id = id
        self.accountNumber = accountNumber
        self.balance = balance
        self.currencyCode = currencyCode
        self.accountType = accountType
        self.accountNickname = accountNickname
    }
    
}
extension Account {
    static func getMockAccountList() async -> [Account] {
        try? await Task.sleep()
            return [Account(id: "1f34c76a-b3d1-43bc-af91-a82716f1bc2e1",
                        accountNumber: 66,
                        balance: "500.00",
                        currencyCode: "BRL",
                        accountType: "current",
                        accountNickname: "Minha Conta"),
                Account(id: "af36e25f-a02e-4be2-b8c5-1667d4a0da8c2",
                        accountNumber: 654,
                        balance: "2500005.00",
                        currencyCode: "USD",
                        accountType: "savings",
                        accountNickname: "American Account"),
                Account(id: "af36e25f-a02e-4be2-b8c5-1667d4a0da8c3",
                        accountNumber: 654,
                        balance: "2500005.00",
                        currencyCode: "USD",
                        accountType: "savings",
                        accountNickname: Constants.noData),
                Account(id: "af36e25f-a02e-4be2-b8c5-1667d4a0da8c4",
                        accountNumber: 654,
                        balance: "2500005.00",
                        currencyCode: "USD",
                        accountType: "savings",
                        accountNickname: "American Account"),
                Account(id: "af36e25f-a02e-4be2-b8c5-1667d4a0da8c5",
                        accountNumber: 654,
                        balance: "2500005.00",
                        currencyCode: "USD",
                        accountType: "savings",
                        accountNickname: "American Account"),
                    Account(id: "af36e25f-a02e-4be2-b8c5-1667d4a0da8c6",
                            accountNumber: 66664,
                            balance: "1005.00",
                            currencyCode: "USD",
                            accountType: "savings",
                            accountNickname: "American Account")]
    }
    static func getEmptyMockAccountList() async -> [Account] {
        try? await Task.sleep()
        return []
    }
}
