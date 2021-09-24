//
//  ScorecardCell.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 12/09/21.
//

import UIKit

class ScorecardCell: UITableViewCell {
    
    static let identifier = "ScorecardCell_Identifier"
    
    private let objectiveLabel = UILabel(font: .systemFont(ofSize: 18, weight: .regular), textColor: .customBlackColor, alignment: .left)
    private let scoreLabel = UILabel(font: .systemFont(ofSize: 18, weight: .regular), textColor: .customBlackColor, alignment: .right)
    
    var scorecard: Scorecard! {
        didSet {
            objectiveLabel.text = scorecard.objective
            scoreLabel.text = scorecard.score
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        let scorecardStackView = StackView(axis: .horizontal, arrangedSubviews: [objectiveLabel, scoreLabel], spacing: 8, alignment: .leading)
        contentView.addSubview(scorecardStackView)
        scorecardStackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}




