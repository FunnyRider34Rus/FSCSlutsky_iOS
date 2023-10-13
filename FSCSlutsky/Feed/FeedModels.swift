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
                case setFeed(feed: Feeds)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayFeed(feedViewModel: FeedViewModel)
            }
        }
    }
}

protocol FeedCellViewModel {
    var bodyText: String? { get }
    var dateText: String { get }
    var attachment: FeedCellAttachmentsViewModel? { get }
}

protocol FeedCellAttachmentsViewModel {
    var imageURL: String? { get }
    var width: Int? { get }
    var height: Int? { get }
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var bodyText: String?
        var dateText: String
        var attachment: FeedCellAttachmentsViewModel?
    }
    
    struct FeedCellAttachmen: FeedCellAttachmentsViewModel {
        var imageURL: String?
        var width: Int?
        var height: Int?
    }
    
    let cells: [Cell]
}
