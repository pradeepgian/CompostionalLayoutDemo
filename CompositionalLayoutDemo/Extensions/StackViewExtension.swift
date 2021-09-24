//
//  StackViewExtension.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import UIKit

class StackView: UIStackView {

    init(axis: NSLayoutConstraint.Axis = .horizontal, arrangedSubviews: [UIView], spacing: CGFloat = 0, alignment: Alignment) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = axis
        self.alignment = alignment
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
