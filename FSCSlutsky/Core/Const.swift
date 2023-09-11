//
//  AppConst.swift
//  FSCSlutsky
//
//  Created by Павел on 30.08.2023.
//

import Foundation
import UIKit

enum Const {
    static let appCode = Bundle.main.object(forInfoDictionaryKey: "AppCode") as! String
    static let smallnsets: CGFloat = 8
    static let mediumInsets: CGFloat = 12
    static let longInsets: CGFloat = 16
    static let cardViewInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
    static let postLabelInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
}
