//
//  DashboardHeaderView.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 12/09/21.
//

import UIKit

class DashboardHeaderView: UICollectionReusableView {
    
    static let identifier = "DashboardHeader_Identifier"
    
    let sectionHeaderLabel = UILabel(font: .boldSystemFont(ofSize: 16), textColor: .customBlackColor, alignment: .left)
    let viewAllLabel = UILabel(text: "View all", font: .boldSystemFont(ofSize: 16), textColor: .customGreenColor, alignment: .right)
    private lazy var stackView = StackView(arrangedSubviews: [sectionHeaderLabel, viewAllLabel], spacing: 0, alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 5, left: 0, bottom: 0, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
