//
//  TransactionsTableViewCell.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

import UIKit
class TransactionTableViewCell: UITableViewCell {
    
    private let contentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9220661521, green: 0.9220661521, blue: 0.9220661521, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 3
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private let transactionDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Class Properties
    static let reuseIdentifier: String = "TransactionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.contentContainer)
        self.contentContainer.addSubview(self.transactionDateLabel)
        self.contentContainer.addSubview(self.transactionAmountLabel)
        self.contentContainer.addSubview(self.transactionTypeLabel)
        self.contentContainer.addSubview(self.transactionDescriptionLabel)
        
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(for transaction: Transaction) {
        let formatter = DateFormatter()
        formatter.dateFormat = "d/MM/yyyy"
        let date = formatter.string(from: transaction.date)
        self.transactionDateLabel.text = date
        self.transactionAmountLabel.text = transaction.transactionAmount
        if transaction.transactionAmount.contains("-") {
            self.transactionAmountLabel.textColor = .red
        } else {
            self.transactionAmountLabel.textColor = .green
        }
        self.transactionTypeLabel.text = transaction.transactionType
        
        if transaction.description == Constants.noData {
            self.transactionDescriptionLabel.isHidden = true
        } else {
            self.transactionDescriptionLabel.isHidden = false
            self.transactionDescriptionLabel.text = transaction.description
        }
    }
    
    private func setupConstraints() {
    NSLayoutConstraint.activate([
        // Container
        self.contentContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
        self.contentContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        self.contentContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
        self.contentContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
        
        self.transactionTypeLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 10),
        self.transactionTypeLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 10),

        self.transactionDateLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 10),
        self.transactionDateLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -10),
        
        self.transactionDescriptionLabel.topAnchor.constraint(equalTo: self.transactionTypeLabel.bottomAnchor, constant: 7),
        self.transactionDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 10),
        
        self.transactionAmountLabel.topAnchor.constraint(equalTo: self.transactionDateLabel.bottomAnchor, constant: 10),
        self.transactionAmountLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -8),
        self.transactionAmountLabel.bottomAnchor.constraint(equalTo: self.contentContainer.bottomAnchor, constant: -8)
    ])
}
    
    
}
