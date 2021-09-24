//
//  UIImageView+Style.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, cornerRadius: CGFloat) {
        self.init(image: image)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
}

