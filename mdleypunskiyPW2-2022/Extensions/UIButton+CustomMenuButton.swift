//
//  UIButton+CustomMenuButton.swift
//  mdleypunskiyPW2-2022
//
//  Created by Maxim Leypunskiy on 17/09/2022.
//

import UIKit

extension UIButton {
    
    class func makeMenuButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        return button
    }
}
