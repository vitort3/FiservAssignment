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
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountNicknameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .opaqueSeparator
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    //MARK: Class Properties
    static let reuseIdentifier: String = "AccountTableViewCell"

    //MARK: ViewLifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.contentContainer)
        self.contentContainer.addSubview(self.accountBalanceLabel)
        self.contentContainer.addSubview(self.accountTypeLabel)
        self.contentContainer.addSubview(self.accountNicknameLabel)
        
        self.setupConstraints()
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
    
    func setupCell(for account: Account) {
        self.accountBalanceLabel.text = "\(account.balance) \(account.currencyCode)"
        self.accountTypeLabel.text = account.accountType
        self.accountNicknameLabel.text = account.accountNickname == "NO_DATA" ? "Account Number: \(account.accountNumber)" : account.accountNickname
    }
    
    private func setupConstraints() {
        self.contentContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.contentContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        self.contentContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.contentContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        
        
        self.accountNicknameLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 5).isActive = true
        self.accountNicknameLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 10).isActive = true
        
        self.accountBalanceLabel.centerYAnchor.constraint(equalTo: self.contentContainer.centerYAnchor).isActive = true
        self.accountBalanceLabel.centerXAnchor.constraint(equalTo: self.contentContainer.centerXAnchor).isActive = true
        
        self.accountTypeLabel.bottomAnchor.constraint(equalTo: self.contentContainer.bottomAnchor, constant: -5).isActive = true
        self.accountTypeLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -10).isActive = true
        
    }
    
    
}

