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
            var result = Feeds(items: [])
            dataFetcher.getFeed { [weak self] (feedResponse) in
                guard let feedResponse = feedResponse else { return }
                for item in feedResponse.items {
                    guard let attachments = item.attachments else { return }
                    for photo in attachments {
                        if photo.type == "photo" {
                            result.items.append(item)
                            break
                        }
                    }
                    self?.presenter?.presentData(response: .setFeed(feed: result))
                }
            }
        }
    }
}
