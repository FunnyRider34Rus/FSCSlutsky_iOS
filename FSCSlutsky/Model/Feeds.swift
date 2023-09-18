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
}

struct Feed: Decodable {
    let id: Int
    let date: Double
    let text: String?
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let attachments: [Attachment]?
}

struct Attachment: Decodable {
    let type: String
    let photo: Photo?
    let video: Video?
}

struct Photo: Decodable {
    let sizes: [PhotoSize]
    
    var height: Int {
        return getPropperSize().height
    }
    
    var width: Int {
        return getPropperSize().width
    }
    
    var url: String {
        return getPropperSize().url
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

struct Video: Decodable {
    let photo800: String
}

struct PhotoSize: Decodable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct CountableItem: Decodable {
    let count: Int
}
