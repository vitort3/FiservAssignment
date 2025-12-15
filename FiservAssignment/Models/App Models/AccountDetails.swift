//
//  AccountDetails.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//
import Foundation

struct AccountDetails {
    let productName: String
    let openedDate: Date
    let branch: String
    let beneficiaries: [String]
    
    init(from response: AccountDetailsModelResponse) {
        self.productName = response.productName
        self.openedDate = response.openedDate.asDate ?? Date()
        self.branch = response.branch
        self.beneficiaries = response.beneficiaries
    }
    
    init (productName: String, openedDate: String, branch: String, beneficiaries: [String]) {
        self.productName = productName
        self.openedDate = openedDate.asDate ?? Date()
        self.branch = branch
        self.beneficiaries = beneficiaries
    }
}

extension AccountDetails {
    static func getMockAccountDetails() -> AccountDetails {
       
        return AccountDetails(productName: "Current Account EUR",
                              openedDate: "2015-12-23T10:15:30Z",
                              branch: "Main Branch",
                              beneficiaries: ["John Doe", "Jane Smith", "Alice Johnson", "Charlie Brown", "Lucy Liu", "Sophia Meier", "Emil Schmidt", "Isabella Eriksson", "Arthur Eriksson", "Emma Andersson"])
    }
}
