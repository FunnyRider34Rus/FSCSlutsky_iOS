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
        static let insets = UIEdgeInsets(top: 4, left: 8, bottom: -4, right: -8)
        static let corners: CGFloat = 16
    }
    
    enum BodyText {
        enum Font {
            enum Size {
                static let bodyFontSize = UIFont.systemFont(ofSize: 16)
                static let dateFontSize = UIFont.systemFont(ofSize: 12)
            }
            static let font = UIFont.systemFont(ofSize: 18)
        }
        static let insets = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
    }
    
    enum Insets {
        static let small: CGFloat = 8
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        
    }
    
    enum Colors {
        static let foreground = #colorLiteral(red: 0.125241369, green: 0.6310095787, blue: 0.8865587115, alpha: 1)
        static let background = UIColor.white
        static let text = UIColor.black
        static let date = UIColor.gray
    }
}
