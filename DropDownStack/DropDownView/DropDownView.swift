//
//  DropDownView.swift
//  DropDownStack
//
//  Created by Nguyen Chi Thanh on 10/27/19.
//  Copyright © 2019 Nguyen Chi Thanh. All rights reserved.
//

import UIKit

class DropDownView<T>: UIStackView {
    typealias Item<T> = DropDownItem<T>
    
    private(set) var items: [Item<T>]
    private var buttons = [DropDownButton]()
    private var selectedButton: DropDownButton?
    private var configuration: DropDownConfiguration
    
    private var isDroped = false {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.handleDropped()
            }, completion: nil)
        }
    }
    var didSelect: ((_ item: Item<T>) -> Void)?
    
    init(_ frame: CGRect = .zero, items: [Item<T>], configuration: DropDownConfiguration) {
        self.items = items
        self.configuration = configuration
        super.init(frame: frame)
        setupComponents()
    }
    
    required init(coder: NSCoder) {
        self.items = []
        self.configuration = DropDownConfiguration(itemSize: .dynamic, checkIcon: nil)
        super.init(coder: coder)
        setupComponents()
    }
    
    private func setupComponents() {
        axis = .vertical
        buttons.forEach { $0.removeFromSuperview() }
        buttons.removeAll()
        items.enumerated().forEach { (index, item) in
            let btn = DropDownButton(.zero, title: item.title, icon: nil)
            btn.translatesAutoresizingMaskIntoConstraints = false
            switch configuration.itemSize {
            case .height(let height):
                btn.heightAnchor.constraint(equalToConstant: height).isActive = true
            case .width(let width):
                btn.widthAnchor.constraint(equalToConstant: width).isActive = true
            case .size(let size):
                btn.heightAnchor.constraint(equalToConstant: size.height).isActive = true
                btn.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            default:
                break
            }
            btn.addTarget(self, action: #selector(didTapOnButton(_:)), for: .touchUpInside)
            buttons.append(btn)
            addArrangedSubview(btn)
            
            if index < items.count {
                addArrangedSubview(makeASeparetor())
            }
        }
        
        setupBackgroundView()
                
        selectedButton = buttons.first
        isDroped = false
    }
    
    private func setupBackgroundView() {
        let bgView = UIView()
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 4
        insertSubview(bgView, at: 0)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func makeASeparetor() -> UIView {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.backgroundColor = .lightGray
        return line
    }
    
    @objc private func didTapOnButton(_ sender: DropDownButton) {
        selectedButton?.iconView.image = nil
        selectedButton = sender
        selectedButton?.iconView.image = configuration.checkIcon
        isDroped = !isDroped
        if let index = buttons.firstIndex(of: sender), !isDroped {
            didSelect?(items[index])
        }
    }
    
    private func handleDropped() {
        guard let selectedBtn = selectedButton else { return }
        if self.isDroped {
            selectedButton?.iconView.image = configuration.checkIcon
            arrangedSubviews.forEach {
                $0.isHidden = false
                $0.alpha = 1
            }
        } else {
            arrangedSubviews.forEach {
                $0.isHidden = true
                $0.alpha = 0
            }
            selectedBtn.isHidden = false
            selectedBtn.alpha = 1
            selectedButton?.iconView.image = nil
        }
    }
    
    struct DropDownItem<T> {
        let title: String
        let model: T
    }
}

enum DropDownItemSize {
    case dynamic
    case height(CGFloat)
    case width(CGFloat)
    case size(CGSize)
}

struct DropDownConfiguration {
    let font = UIFont.systemFontSize
    let textColor = UIColor.black
    let itemSize: DropDownItemSize
    let checkIcon: UIImage?
}
