//
//  FeedResponse.swift
//  FSCSlutsky
//
//  Created by Павел on 08.09.2023.
//

import Foundation

struct Response: Decodable {
    let response: Feeds
}

struct Feeds: Decodable {
    var items: [Feed]
    var nextFrom: String?
}

struct Feed: Decodable {
    let id: Int
    let date: Double
    var text: String?
    let attachments: [Attachment]?
}

struct Attachment: Decodable {
    let type: String
    let photo: Photo?
}

struct Photo: Decodable {
    let sizes: [PhotoSize]
    
    var url: String {
        return getPropperSize().url
    }
    
    var width: Int {
        return getPropperSize().width
    }
    
    var height: Int {
            return getPropperSize().height
    }
    
    private func getPropperSize() -> PhotoSize {
        if let sizeX = sizes.first(where: { $0.type == "x" }) {
            return sizeX
        } else if let fallBackSize = sizes.last {
            return fallBackSize
        } else {
            return PhotoSize(type: "wrong image", url: "wrong image", width: 0, height: 0)
        }
    }
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}
