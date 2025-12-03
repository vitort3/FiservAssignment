//
//  AccountTableViewCell.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 02/12/25.
//
import UIKit

class AccountTableViewCell: UITableViewCell {
    //MARK: UI Elements
    private lazy var accountBalanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountNicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    //MARK: Class Properties
    private let account: Account

    //MARK: ViewLifeCycle
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, accountToDisplay currentAccount: Account) {
        self.account = currentAccount
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accountTypeLabel.text = nil
        self.accountBalanceLabel.text = nil
        self.accountNicknameLabel.text = nil
    }
    
    private func setupCell() {
        self.accessoryType = .disclosureIndicator
        self.contentView.addSubview(self.accountBalanceLabel)
        self.contentView.addSubview(self.accountTypeLabel)
        self.contentView.addSubview(self.accountNicknameLabel)
        
        self.accountBalanceLabel.text = "\(account.balance) \(account.currencyCode)"
        self.accountTypeLabel.text = account.accountType
        self.accountNicknameLabel.text = account.accountNickname == "NO_DATA" ? "\(account.accountNumber)" : account.accountNickname
        
        self.setupConstraints()

    }
    
    private func setupConstraints() {
        self.accountNicknameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.accountNicknameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        
        self.accountBalanceLabel.topAnchor.constraint(equalTo: self.accountNicknameLabel.bottomAnchor, constant: 5).isActive = true
        self.centerXAnchor.constraint(equalTo: self.accountBalanceLabel.centerXAnchor).isActive = true
        
        self.accountTypeLabel.topAnchor.constraint(equalTo: self.accountBalanceLabel.bottomAnchor, constant: 5).isActive = true
        self.accountTypeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        
        
    }
    
    
}
