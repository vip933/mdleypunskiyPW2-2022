//
//  ViewController.swift
//  mdleypunskiyPW2-2022
//
//  Created by Maxim Leypunskiy on 17/09/2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let INC_BUTTON_CORNER_RADIUS: CGFloat = 12
    private let INC_BUTTON_FONT_SIZE: CGFloat = 25
    private let INC_BUTTON_TEXT = "Push me"
    
    private let VALUE_LABEL_FONT_SIZE: CGFloat = 40
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    private var value: Int = 0
    private let incrementButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .lightGray
        setupIncrementButton()
        setupValueLabel()
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle(INC_BUTTON_TEXT, for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = INC_BUTTON_CORNER_RADIUS
        incrementButton.titleLabel?.font = .systemFont(ofSize: INC_BUTTON_FONT_SIZE, weight: .medium)
        incrementButton.backgroundColor = .white
        //incrementButton.layer.applyShadow()
        view.addSubview(incrementButton)
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: view.centerYAnchor)
        incrementButton.pin(to: view, [.left: 24, .right: 24])
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
                                        
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: VALUE_LABEL_FONT_SIZE, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenter(to: view.centerXAnchor)
    }
    
    @objc
    private func incrementButtonPressed() {
        value += 1
        updateUI()
    }
    
    private func updateUI() {
        valueLabel.text = "\(value)"
    }
}

