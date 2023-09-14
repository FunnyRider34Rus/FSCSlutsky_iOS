//
//  FeedPresenter.swift
//  FSCSlutsky
//
//  Created by Павел on 12.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FeedPresentationLogic {
    func presentData(response: FeedData.Model.Response.ResponseType)
}

class FeedPresenter: FeedPresentationLogic {
  
    weak var viewController: FeedDisplayLogic?
  
    func presentData(response: FeedData.Model.Response.ResponseType) {
        switch response {
        case .setFeed:
            print("FeedPresenter .setFeed")
            viewController?.displayData(viewModel: .displayFeed)
        }
    }
}
