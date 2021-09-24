//
//  SummaryCell.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import UIKit

class SummaryCell: UICollectionViewCell {
    
    static let cellIdentifier = "SummaryCell_Identifier"
    private let scoreLabel = UILabel(font: .systemFont(ofSize: 20, weight: .bold), textColor: .customBlackColor)
    private let activityTitleLabel = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textColor: .customBlackColor, numberOfLines: 0)
    
    var activity: Activity! {
        didSet {
            activityTitleLabel.text = activity.title
            scoreLabel.text = activity.score
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 0.5
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.customBlackColor.cgColor
        let stackView = StackView(axis: .vertical, arrangedSubviews: [scoreLabel, activityTitleLabel], spacing: 6, alignment: .center)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
