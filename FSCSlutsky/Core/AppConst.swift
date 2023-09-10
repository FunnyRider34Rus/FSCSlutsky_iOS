//
//  AppConst.swift
//  FSCSlutsky
//
//  Created by Павел on 30.08.2023.
//

import Foundation
import UIKit

enum AppConst {
    static let appCode = Bundle.main.object(forInfoDictionaryKey: "AppCode") as! String
    static let cardViewInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    static let topViewHeight: CGFloat = 46
    static let postLabelInsets = UIEdgeInsets(top: 8 + topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFontSize = UIFont.systemFont(ofSize: 15)
    static let bottomViewHeight: CGFloat = 60
}
