//
//  AccountDetailsTableViewCell.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//
import UIKit

class AccountDetailsTableViewCell: UITableViewCell {
    //MARK: UI Elements
    private let accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let openedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accountBranchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let accountBeneficiariesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let contentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9220661521, green: 0.9220661521, blue: 0.9220661521, alpha: 1)
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        return view
    }()
    
    //MARK: Class Properties
    static let reuseIdentifier: String = "AccountDetailsTableViewCell"

    //MARK: ViewLifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        self.contentView.addSubview(self.contentContainer)
        self.contentContainer.addSubview(self.accountTypeLabel)
        self.contentContainer.addSubview(self.productNameLabel)
        self.contentContainer.addSubview(self.openedDateLabel)
        self.contentContainer.addSubview(self.accountBranchLabel)
        self.contentContainer.addSubview(self.accountBeneficiariesLabel)
        
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.accountTypeLabel.text = nil
        self.productNameLabel.text = nil
        self.openedDateLabel.text = nil
        self.accountBranchLabel.text = nil
        self.accountBeneficiariesLabel.text = nil
        
        self.contentView.subviews.forEach { subView in
            if subView !== self.contentContainer {
                subView.removeFromSuperview()
            }
        }
    }
    
    func setupCell(for account: Account, andDetails accountDetails: AccountDetails) {
        self.accessoryType = .none
        
        let accountTypeAttrString = NSMutableAttributedString([
            ["Type: ": [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]],
            [account.accountType:[
                .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
            ]]
        ])
        self.accountTypeLabel.attributedText = accountTypeAttrString
        
        let productNameAttrString = NSMutableAttributedString([
            ["Product Name: ": [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]],
            [accountDetails.productName:[
                .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
            ]]
        ])
        self.productNameLabel.attributedText = productNameAttrString
        
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        let date = formatter.string(from: accountDetails.openedDate)
        let openedDateAttrString = NSMutableAttributedString([
            ["Opened Date: ": [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]],
            [date:[
                .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
            ]]
        ])
        self.openedDateLabel.attributedText = openedDateAttrString
        
        let accountBranchAttrString = NSMutableAttributedString([
            ["Branch: ": [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]],
            [accountDetails.branch:[
                .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
            ]]
        ])
        self.accountBranchLabel.attributedText = accountBranchAttrString
        
        let accountBeneficiariesAttrString = NSMutableAttributedString([
            ["Beneficiaries: ": [
                .font: UIFont.systemFont(ofSize: 19, weight: .bold)
            ]],
            [accountDetails.beneficiaries.joined(separator: ", "):[
                .font: UIFont.systemFont(ofSize: 17, weight: .regular)
            ]]
        ])
        self.accountBeneficiariesLabel.attributedText = accountBeneficiariesAttrString

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Content Container
            self.contentContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            self.contentContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            self.contentContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.contentContainer.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            
            // Account Type Label
            self.accountTypeLabel.topAnchor.constraint(equalTo: self.contentContainer.topAnchor, constant: 5),
            self.accountTypeLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.accountTypeLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            
            // Product Name Label
            self.productNameLabel.topAnchor.constraint(equalTo: self.accountTypeLabel.bottomAnchor, constant: 5),
            self.productNameLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.productNameLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            
            // Opened Date Label
            self.openedDateLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 5),
            self.openedDateLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.openedDateLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            
            // Account Branch Label
            self.accountBranchLabel.topAnchor.constraint(equalTo: self.openedDateLabel.bottomAnchor, constant: 5),
            self.accountBranchLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.accountBranchLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            
            // Account Beneficiaries Label
            self.accountBeneficiariesLabel.topAnchor.constraint(equalTo: self.accountBranchLabel.bottomAnchor, constant: 5),
            self.accountBeneficiariesLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.accountBeneficiariesLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            self.accountBeneficiariesLabel.bottomAnchor.constraint(equalTo: self.contentContainer.bottomAnchor, constant: -5)
        ])
    }
}
