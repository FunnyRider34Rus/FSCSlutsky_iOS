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

    var interactor: FeedBusinessLogic?
    var router: (NSObjectProtocol & FeedRoutingLogic)?

    // MARK: Object lifecycle
  
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
  
    // MARK: Routing
  

  
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Новости"
        view.backgroundColor = DesignSystem.Colors.background
        tableView.register(FeedViewCell.self, forCellReuseIdentifier: "FeedCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = "index: \(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.makeRequest(request: .getFeed)
    }
  
    func displayData(viewModel: FeedData.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayFeed:
            print("FeedViewController .displayFeed")
        }
    }
}
