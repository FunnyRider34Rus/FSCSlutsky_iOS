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
    
    func makeRequest(request: FeedData.Model.Request.RequestType) {
        if service == nil {
            service = FeedService()
        }
        switch request {
        case .getFeed:
            var result = Feeds(items: [])
            service?.getFeed(completion: { [weak self] (feed) in
                for item in feed.items {
                    guard let attachments = item.attachments else { return }
                    for photo in attachments {
                        if photo.type == "photo" {
                            result.items.append(item)
                            break
                        }
                    }
                    self?.presenter?.presentData(response: .setFeed(feed: result))
                }
            })
        }
    }
}
