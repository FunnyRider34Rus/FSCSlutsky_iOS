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
            print("FeedInteractor: .getFeed")
            presenter?.presentData(response: .setFeed)
        }
    }
}
