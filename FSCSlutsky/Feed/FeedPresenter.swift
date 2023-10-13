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
    
    let dateFormatter: DateFormatter = {
        let dt = DateFormatter()
        dt.locale = Locale(identifier: "ru_RU")
        dt.dateFormat = "d MMM 'в' HH:mm"
        return dt
    }()
    
    func presentData(response: FeedData.Model.Response.ResponseType) {
        switch response {
        case .setFeed(feed: let feed):
            let cells = feed.items.map { feed in
                cellViewModel(from: feed)
            }
            
            let feedViewModel = FeedViewModel.init(cells: cells)
            
            viewController?.displayData(viewModel: .displayFeed(feedViewModel: feedViewModel))
        }
    }
    
    private func cellViewModel(from feedItem: Feed) -> FeedViewModel.Cell {
        let attachment = self.photoAttachment(feedItem: feedItem)
        let date = Date(timeIntervalSince1970: feedItem.date)
        let dateString = dateFormatter.string(from: date)
        let formattingText = feedItem.text?.components(separatedBy: "[")[0]
        return FeedViewModel.Cell.init(
            bodyText: formattingText,
            dateText: dateString,
            attachment: attachment
        )
    }
    
    private func photoAttachment(feedItem: Feed) -> FeedViewModel.FeedCellAttachmen? {
        guard let attachment = feedItem.attachments?.compactMap({ (attachment) in
            attachment
        }) else {
            return nil
        }
        
        var url: String?
        var width: Int?
        var height: Int?
        
        if attachment.first?.type == "photo" {
            url = attachment.first?.photo?.url
            width = attachment.first?.photo?.width
            height = attachment.first?.photo?.height
        }
        
        
        return FeedViewModel.FeedCellAttachmen.init(
            imageURL: url,
            width: width,
            height: height
        )
    }
}
