//
//  FeedModels.swift
//  FSCSlutsky
//
//  Created by Павел on 12.09.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FeedData {
    enum Model {
        struct Request {
            enum RequestType {
                case getFeed
            }
        }
        struct Response {
            enum ResponseType {
                case setFeed
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayFeed
            }
        }
    }
}
