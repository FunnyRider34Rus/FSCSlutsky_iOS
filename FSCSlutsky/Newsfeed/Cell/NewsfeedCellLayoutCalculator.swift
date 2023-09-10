//
//  NewsfeedCellLayoutCalculator.swift
//  FSCSlutsky
//
//  Created by Павел on 10.09.2023.
//

import Foundation
import UIKit

struct Sizes: FeedCellSizes {
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    var bottomFrame: CGRect
    var totalHeight: CGFloat
}

protocol FeedCellLayoutCalculatorProtocol {
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes
}


final class FeedCellLayoutCalculator: FeedCellLayoutCalculatorProtocol {

    private let screenWidgth: CGFloat
    
    init(screenWidgth: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidgth = screenWidgth
    }
    
    func sizes(postText: String?, photoAttachment: FeedCellPhotoAttachmentViewModel?) -> FeedCellSizes {
        
        let cardViewWidght = screenWidgth - AppConst.cardViewInsets.left - AppConst.cardViewInsets.right
        
        var postLabelFrame = CGRect(origin: CGPoint(x: AppConst.postLabelInsets.left, y: AppConst.postLabelInsets.top), size: CGSize.zero)
        
        if let text = postText, !text.isEmpty {
            let width = cardViewWidght - AppConst.postLabelInsets.left - AppConst.postLabelInsets.right
            let height = text.height(width: width, font: AppConst.postLabelFontSize)
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        
        let attachmentTop = postLabelFrame.size == CGSize.zero ? AppConst.postLabelInsets.top : postLabelFrame.maxY + AppConst.postLabelInsets.bottom
        var attachmentFrame = CGRect(origin: CGPoint(x: 0, y: attachmentTop), size: CGSize.zero)
        
        if let attachment = photoAttachment {
            let photoWidght = Float(attachment.width)
            let photoHeight = Float(attachment.height)
            let ratio = CGFloat(photoHeight / photoWidght)
            attachmentFrame.size = CGSize(width: cardViewWidght, height: cardViewWidght * ratio)
        }
        
        let bottomViewTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        let bottomFrame = CGRect(origin: CGPoint(x: 0, y: bottomViewTop), size: CGSize(width: cardViewWidght, height: AppConst.bottomViewHeight))
        
        let totalHeight = bottomFrame.maxY + AppConst.cardViewInsets.bottom
        
        return Sizes(postLabelFrame: postLabelFrame, attachmentFrame: attachmentFrame, bottomFrame: bottomFrame, totalHeight: totalHeight)
    }
}
