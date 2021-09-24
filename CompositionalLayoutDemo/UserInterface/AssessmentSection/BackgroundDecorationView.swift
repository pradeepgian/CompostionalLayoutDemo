//
//  BackgroundDecorationView.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import UIKit

class BackgroundDecorationView: UICollectionReusableView {

    static let identifier = "BackgroundViewCell_Identifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}
