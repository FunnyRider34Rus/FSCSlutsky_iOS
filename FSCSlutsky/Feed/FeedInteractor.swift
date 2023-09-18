//
//  FeedInteractor.swift
//  FSCSlutsky
//
//  Created by Павел on 12.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FeedBusinessLogic {
  func makeRequest(request: FeedData.Model.Request.RequestType)
}

class FeedInteractor: FeedBusinessLogic {

    var presenter: FeedPresentationLogic?
    var service: FeedService?
    private var dataFetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: FeedData.Model.Request.RequestType) {
        if service == nil {
            service = FeedService()
        }
        
        switch request {
        case .getFeed:
            dataFetcher.getFeed { [weak self] (feedResponse) in
                guard let feedResponse = feedResponse else { return }
                self?.presenter?.presentData(response: .setFeed(feed: feedResponse))
            }
        }
    }
}
