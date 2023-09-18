//
//  DesignSystem.swift
//  FSCSlutsky
//
//  Created by Павел on 13.09.2023.
//

import UIKit

struct DesignSystem {
    
    enum Button {
        static let insets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        static let corners = UIButton.Configuration.CornerStyle.medium
        static let textColor = UIColor.white
        static let backgroundColor = UIColor.systemBlue
    }
    
    enum CardView {
        static let corners: CGFloat = 16
    }
    
    enum Text {
        enum Font {
            enum Size {
                static let bodyFontSize = UIFont.systemFont(ofSize: 16)
                static let dateFontSize = UIFont.systemFont(ofSize: 12)
            }
        }
    }
    
    enum Insets {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let cardView = UIEdgeInsets(top: 4, left: 8, bottom: -4, right: -8)
        static let postLabel = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
    }
    
    enum Colors {
        static let foreground = UIColor.systemBlue
        static let background = UIColor.white
        static let text = UIColor.black
        static let date = UIColor.gray
    }
}
