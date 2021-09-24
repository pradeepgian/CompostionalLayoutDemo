//
//  PeopleCell.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 11/09/21.
//

import UIKit
import SDWebImage

class PersonCell: UICollectionViewCell {
    
    static let cellIdentifier = "PeopleCell_Identifier"
    
    private let personImageView = UIImageView(image:#imageLiteral(resourceName: "UserIcon"), cornerRadius: 40)
    private let nameLabel = UILabel(font: .systemFont(ofSize: 14, weight: .semibold), textColor: .black, numberOfLines: 0, alignment: .center)
    
    var person: Person! {
        didSet {
            personImageView.sd_setImage(with: URL(string: person.picture.medium))
            nameLabel.text = "\(person.name.first)\n\(person.name.last)"
            if person.showOuterCircleBool {
                imageContainerView.layer.borderColor = UIColor.customGreenColor.cgColor
            } else {
                imageContainerView.layer.borderColor = UIColor.clear.cgColor
            }
        }
    }
    
    private let imageContainerView: UIView = {
        let imageContainerView = UIView()
        imageContainerView.constrainWidth(constant: 90)
        imageContainerView.constrainHeight(constant: 90)
        imageContainerView.backgroundColor = .white
        imageContainerView.layer.borderWidth = 3
        imageContainerView.layer.borderColor = UIColor.clear.cgColor
        imageContainerView.layer.masksToBounds = true
        imageContainerView.layer.cornerRadius = 90/2
        return imageContainerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = false
        personImageView.clipsToBounds = true
        personImageView.constrainWidth(constant: 80)
        personImageView.constrainHeight(constant: 80)
        personImageView.layer.cornerRadius = 80 / 2
        imageContainerView.addSubview(personImageView)
        personImageView.centerInSuperview()
        
        let stackView = StackView(axis: .vertical, arrangedSubviews: [imageContainerView, nameLabel], spacing: 4, alignment: .center)
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
