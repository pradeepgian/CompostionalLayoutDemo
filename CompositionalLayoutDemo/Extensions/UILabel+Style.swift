//
//  UILabel+Style.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import UIKit

extension UILabel {
    
    public convenience init(text: String? = nil,
                            font: UIFont? = nil,
                            textColor: UIColor,
                            numberOfLines: Int = 1,
                            alignment: NSTextAlignment = .center) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.numberOfLines = numberOfLines
        self.textAlignment = alignment
        if let font = font {
            self.font = font
        }
    }
    
}
