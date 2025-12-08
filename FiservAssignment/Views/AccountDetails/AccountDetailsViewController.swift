//
//  AccountDetailsViewController.swift
//  FiservAssignment
//
//  Created by vitoraugusto.dearaujosilva on 03/12/25.
//

import UIKit

class AccountDetailsViewController: UIViewController {
    //MARK: UI Elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.hidesWhenStopped = true
        view.color = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Class Properties
    private let viewModel: AccountDetailsViewModel
    private var hasTransactions = false
    
    //MARK: ViewLifeCycle
    init(viewModel: AccountDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupTableView()
        self.bindViewModel()
        self.viewModel.loadAccountDetailsAndTransactions()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Functions
    
    private func setupNavigationBarButton() {
        let starImage = UIImage(systemName: "star")
        let starButton = UIBarButtonItem(image: starImage, style: .plain, target: self, action: #selector(starButtonTapped))
        self.navigationItem.rightBarButtonItem = starButton
    }

    @objc private func starButtonTapped() {
        print("Star button tapped")
    }
    
    private func bindViewModel() {
        viewModel.onStateChange = { [weak self] state in
            guard let self else { return }
            
            switch state {
            case .loading:
                self.tableView.isHidden = true
                self.activityIndicator.isHidden = false
                self.activityIndicator.startAnimating()
                self.hasTransactions = false
                
            case .loaded:
                self.tableView.isHidden = false
                self.activityIndicator.isHidden = true
                if !self.viewModel.transactions.isEmpty {
                    self.hasTransactions = true
                }
                self.tableView.reloadData()
                
            case .error(let error):
                //TODO: handle errors
                print(error)
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.reuseIdentifier)
        tableView.register(AccountDetailsTableViewCell.self, forCellReuseIdentifier: AccountDetailsTableViewCell.reuseIdentifier)
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorColor = .clear
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.activityIndicator)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

        
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
 
}

//MARK: Extensions
extension AccountDetailsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
//            if hasTransactions {
//                return self.viewModel.transactions.count
//            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("AAAAAAAAAAAAAAAAAAAAAA")
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.reuseIdentifier, for: indexPath) as?  AccountTableViewCell else { return UITableViewCell() }
            cell.setupCell(for: self.viewModel.account)
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountDetailsTableViewCell.reuseIdentifier, for: indexPath) as? AccountDetailsTableViewCell,
                  let accountDetails = self.viewModel.accountDetails else { return UITableViewCell() }
            
            cell.setupCell(for: self.viewModel.account, andDetails: accountDetails)
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        }
        return 200
    }
}

extension AccountDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
