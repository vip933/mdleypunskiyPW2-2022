//
//  ViewController.swift
//  mdleypunskiyPW2-2022
//
//  Created by Maxim Leypunskiy on 17/09/2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    private let value: Int = 0
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
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        //incrementButton.layer.applyShadow()
        view.addSubview(incrementButton)
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: view.centerYAnchor)
        incrementButton.pin(to: view, [.left: 24, .right: 24])
        //incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for .touchUpInside)
    }
                                        
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: 40.0, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenter(to: view.centerXAnchor)
    }
}

