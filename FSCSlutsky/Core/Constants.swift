//
//  AppConst.swift
//  FSCSlutsky
//
//  Created by Павел on 30.08.2023.
//

import Foundation
import UIKit

// MARK: Глобальные константы
enum Constants {
    static let appCode = Bundle.main.object(forInfoDictionaryKey: "AppCode") as! String
}

// MARK: Сетевые запросы
struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.92"
    static let domain = "fsc_slutsky_vlg"
    static let count = 20
    static let newsFeed = "/method/wall.get"
}
