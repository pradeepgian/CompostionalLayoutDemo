//
//  CategoryCell.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import UIKit

class DashboardCategoryCell: UICollectionViewCell {
    
    static let cellIdentifier = "CategoryCell_Identifier"
    
    private let categoryLabel = UILabel(font: .systemFont(ofSize: 18), textColor: .black)
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = .customGreenColor
                contentView.layer.borderColor = UIColor.customGreenColor.cgColor
                categoryLabel.textColor = .white
            } else {
                contentView.backgroundColor = .white
                contentView.layer.borderColor = UIColor.customBlackColor.cgColor
                categoryLabel.textColor = .black
            }
        }
    }
    
    var category: Category! {
        didSet {
            categoryLabel.text = category.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 0.5
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.customBlackColor.cgColor
        addSubview(categoryLabel)
        categoryLabel.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
