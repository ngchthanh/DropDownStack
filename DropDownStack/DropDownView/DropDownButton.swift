//
//  DropDownButton.swift
//  DropDownStack
//
//  Created by Nguyen Chi Thanh on 10/27/19.
//  Copyright © 2019 Nguyen Chi Thanh. All rights reserved.
//

import UIKit

class DropDownButton: UIControl {
    let iconView = UIImageView()
    let titleLabel = UILabel()
    
    init(_ frame: CGRect, title: String? = nil, icon: UIImage? = nil) {
        super.init(frame: frame)
        iconView.image = icon
        titleLabel.text = title
        setupMainStack()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupMainStack()
    }
    
    private func setupMainStack() {
        iconView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        let stack = UIStackView(arrangedSubviews: [titleLabel, iconView])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 4
        addSubview(stack)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard touches.count == 1,
            let location = touches.first?.location(in: self),
            bounds.contains(location) else { return }
        sendActions(for: .touchUpInside)
    }
}
