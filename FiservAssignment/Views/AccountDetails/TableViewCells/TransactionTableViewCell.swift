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
        view.backgroundColor = .opaqueSeparator
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    private let transactionDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
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
        
        // Transaction Type (Verde - top-left)
        self.transactionTypeLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 5),
        self.transactionTypeLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
        
        // Transaction Date (Vermelho - top-right)
        self.transactionDateLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 5),
        self.transactionDateLabel.leadingAnchor.constraint(equalTo: self.transactionTypeLabel.trailingAnchor, constant: 10),
        self.transactionDateLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
        
        // Transaction Description (Azul - bottom-left, OPCIONAL)
        self.transactionDescriptionLabel.topAnchor.constraint(equalTo: self.transactionTypeLabel.bottomAnchor, constant: 10),
        self.transactionDescriptionLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
        self.transactionDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.transactionAmountLabel.leadingAnchor, constant: -10),
        
        // Transaction Amount (Amarelo - bottom-right, ANCORA O BOTTOM)
        self.transactionAmountLabel.topAnchor.constraint(equalTo: self.transactionDateLabel.bottomAnchor, constant: 10),
        self.transactionAmountLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
        self.transactionAmountLabel.bottomAnchor.constraint(equalTo: self.contentContainer.bottomAnchor, constant: -5)
    ])
}
    
    
}
