//
//  NewsFeedViewController.swift
//  Assignment
//
//  Created by Shivangi on 12/02/22.
//

import UIKit

class NewsFeedViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Variables
    
    var viewModel: NewsFeedViewModel = NewsFeedViewModel()
    
    //MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    //MARK: Private Methods
    
    private func setup() {
        self.setupTableView()
        
        // API call for feed
        self.fetchNewsFeed()
    }
    
    // TableView Setup
    private func setupTableView() {
        self.tableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: self.tableView.frame.width, height: 18)))
        self.tableView.register(UINib(nibName: LargeArticleTableViewCell.name, bundle: nil), forCellReuseIdentifier: LargeArticleTableViewCell.name)
        self.tableView.register(UINib(nibName: RegularArticleTableViewCell.name, bundle: nil), forCellReuseIdentifier: RegularArticleTableViewCell.name)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // Activity Indicator
    private func startLoader() {
        self.activityIndicatorView.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    private func stopLoader() {
        self.activityIndicatorView.isHidden = true
        self.activityIndicator.stopAnimating()
    }
}

// Table View Delegate
extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.newsFeed?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            // In first cell, display large article
            return self.getLargeArticleTableViewCell(tableView, cellForRowAt: indexPath)
        default:
            // Other cells display regular feed
            return self.getRegularArticleTableViewCell(tableView, cellForRowAt: indexPath)
        }
    }
    
    // Large Article
    private func getLargeArticleTableViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LargeArticleTableViewCell.name, for: indexPath) as? LargeArticleTableViewCell else {
            return UITableViewCell()
        }
        if let data = self.viewModel.newsFeed?[indexPath.row] {
            cell.configureLargeArticleCell(data: data)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    // Regular Article
    private func getRegularArticleTableViewCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegularArticleTableViewCell.name, for: indexPath) as? RegularArticleTableViewCell else {
            return UITableViewCell()
        }
        if let data = self.viewModel.newsFeed?[indexPath.row] {
            cell.configureRegularArticleCell(data: data)
        }
        cell.selectionStyle = .none
        return cell
    }
}

// Table View Datasource
extension NewsFeedViewController: UITableViewDelegate {
    
    // Height of each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NewsFeedViewController {
    
    // API Request for fetching news feed
    func fetchNewsFeed() {
        // Starts Activity Indicator
        self.startLoader()
        
        // API Request
        self.viewModel.fetchRssFeed { [weak self] (newsFeed) in
            DispatchQueue.main.async {
                // Stops Activity Indicator
                self?.stopLoader()
                // Reload data
                self?.tableView.reloadData()
            }
        }
    }
}
