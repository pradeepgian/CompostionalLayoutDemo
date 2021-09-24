//
//  DashboardFooterView.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 12/09/21.
//

import UIKit

class DashboardFooterView: UICollectionReusableView {
    
    static let identifier = "DashboardFooter_Identifier"
    
    let seperatorLine = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(seperatorLine)
        seperatorLine.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 16))
        seperatorLine.backgroundColor = .customBlackColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
