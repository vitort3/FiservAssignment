//
//  AccountListViewController.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 02/12/25.
//

import UIKit

class AccountListViewController: UIViewController {
    //MARK: UI Elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var noAccountsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No accounts available"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        view.color = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Class Properties
    private let viewModel: AccountListViewModel
    
    //MARK: ViewLifeCycle
    init(viewModel: AccountListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupTableView()
        self.setupConstraints()
        self.bindViewModel()
        self.viewModel.loadAccounts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Functions
    
    private func setupTableView() {
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorColor = .clear
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.noAccountsLabel)
        self.view.addSubview(self.activityIndicator)
    }
    
    private func setupConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.noAccountsLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.noAccountsLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    private func bindViewModel() {
        viewModel.onStateChange = { [weak self] state in
            guard let self else { return }
            
            switch state {
            case .loading:
                self.tableView.isHidden = true
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
                self.noAccountsLabel.isHidden = true
                
            case .loaded:
                self.tableView.isHidden = false
                self.activityIndicator.isHidden = true
                self.noAccountsLabel.isHidden = true
                self.tableView.reloadData()
                
            case .error(let error):
                //TODO: handle errors
                print(error)
                
            case .empty:
                self.tableView.isHidden = true
                self.activityIndicator.isHidden = true
                self.noAccountsLabel.isHidden = false
            }
        }
    }
}
//MARK: Extensions
extension AccountListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfAccounts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseIdentifier, for: indexPath) as?  AccountTableViewCell else { return UITableViewCell() }
        let account = viewModel.getAccount(at: indexPath)
        cell.setupCell(for: account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

}

extension AccountListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedAccount = self.viewModel.getAccount(at: indexPath)
        let viewModel = AccountDetailsViewModel(account: selectedAccount)
        let vc = AccountDetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
