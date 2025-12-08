//
//  AccountDetailsTableViewCell.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

class AccountDetailsTableViewCell: UITableViewCell {
    //MARK: UI Elements
    private lazy var accountTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var openedDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountBranchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var accountBeneficiariesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
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
        
        // REMOVIDO: self.backgroundColor = .red
        self.backgroundColor = .clear // ou simplesmente remova essa linha
        
        // MOVIDO: setupConstraints() deve ser chamado aqui, apenas uma vez
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
    }
    
    func setupCell(for account: Account, andDetails accountDetails: AccountDetails) {
        self.accessoryType = .none

        self.accountTypeLabel.text = "Type: \(account.accountType)"
        self.productNameLabel.text = "Product Name: \(accountDetails.productName)"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMMM-yyyy"
        let date = formatter.string(from: accountDetails.openedDate)
        self.openedDateLabel.text = "Opened Date: \(date)"
        self.accountBranchLabel.text = "Branch: \(accountDetails.branch)"
        self.accountBeneficiariesLabel.text = "Beneficiaries: \(accountDetails.beneficiaries)"

        // REMOVIDO: self.setupConstraints() - não deve ser chamado aqui!
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
            
            // Product Name Label
            self.productNameLabel.topAnchor.constraint(equalTo: self.accountTypeLabel.bottomAnchor, constant: 5),
            self.productNameLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            
            // Opened Date Label
            self.openedDateLabel.topAnchor.constraint(equalTo: self.productNameLabel.bottomAnchor, constant: 5),
            self.openedDateLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            
            // Account Branch Label
            self.accountBranchLabel.topAnchor.constraint(equalTo: self.openedDateLabel.bottomAnchor, constant: 5),
            self.accountBranchLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            
            // Account Beneficiaries Label
            self.accountBeneficiariesLabel.topAnchor.constraint(equalTo: self.accountBranchLabel.bottomAnchor, constant: 5),
            self.accountBeneficiariesLabel.leadingAnchor.constraint(equalTo: self.contentContainer.leadingAnchor, constant: 5),
            self.accountBeneficiariesLabel.trailingAnchor.constraint(equalTo: self.contentContainer.trailingAnchor, constant: -5),
            self.accountBeneficiariesLabel.bottomAnchor.constraint(equalTo: self.contentContainer.bottomAnchor, constant: -5)
        ])
    }
}
