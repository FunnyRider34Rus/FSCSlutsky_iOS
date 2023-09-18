//
//  FeedViewController.swift
//  FSCSlutsky
//
//  Created by Павел on 12.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FeedDisplayLogic: AnyObject {
    func displayData(viewModel: FeedData.Model.ViewModel.ViewModelData)
}

class FeedViewController: UITableViewController, FeedDisplayLogic {
    
    static let identifier = "FeedCell"

    var interactor: FeedBusinessLogic?
    var router: (NSObjectProtocol & FeedRoutingLogic)?
    private var feedViewModel = FeedViewModel(cells: [])

    // MARK: Setup
    private func setup() {
        let viewController        = self
        let interactor            = FeedInteractor()
        let presenter             = FeedPresenter()
        let router                = FeedRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
  
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Новости"
        view.backgroundColor = DesignSystem.Colors.background
        tableView.register(FeedViewCell.self, forCellReuseIdentifier: FeedViewController.identifier)
        tableView.separatorStyle = .none
        interactor?.makeRequest(request: .getFeed)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModel.cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewController.identifier, for: indexPath) as? FeedViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = feedViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }
  
    func displayData(viewModel: FeedData.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayFeed(let feedViewModel):
            self.feedViewModel = feedViewModel
            tableView.reloadData()
        }
    }
}
