//
//  ViewController.swift
//  Demo
//
//  Created by Nguyen Chi Thanh on 10/27/19.
//  Copyright © 2019 Nguyen Chi Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let items = [
            DropDownView<Int>.Item(title: "English", model: 0),
            DropDownView.Item(title: "Vietnamese", model: 1),
            DropDownView.Item(title: "Chinese", model: 2),
            DropDownView.Item(title: "Japanese", model: 3),
        ]
        let config = DropDownConfiguration(itemSize: .dynamic, checkIcon: UIImage(named: "icon-check"))
        let dropDownView = DropDownView(items: items, configuration: config)
        view.addSubview(dropDownView)
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        dropDownView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        
        dropDownView.didSelect = { item in
            print("did select \(item)")
        }
    }


}

