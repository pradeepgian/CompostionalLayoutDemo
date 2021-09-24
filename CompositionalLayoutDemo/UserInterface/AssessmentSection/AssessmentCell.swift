//
//  AssessmentCell.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import UIKit

class AssessmentCell: UICollectionViewCell {
    
    static let cellIdentifier = "AssessmentCell_Identifier"
    private let assessmentTitleLabel = UILabel(font: .systemFont(ofSize: 20, weight: .bold), textColor: .customBlackColor, alignment: .left)
    private var scoreCardTableView = ScorecardTableView()
    
    var assessment: Assessment! {
        didSet {
            assessmentTitleLabel.text = assessment.title
            scoreCardTableView.scoreCardData = assessment.scorecard
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .white
        contentView.addSubview(assessmentTitleLabel)
        assessmentTitleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10))
        contentView.addSubview(scoreCardTableView.view)
        scoreCardTableView.view.anchor(top: assessmentTitleLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
