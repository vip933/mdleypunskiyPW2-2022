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
    
    private let COMMENT_VIEW_CORNER_RADIUS: CGFloat = 12
    private let COMMENT_VIEW_FONT_SIZE: CGFloat = 16
    private let COMMENT_VIEW_DEFAULT_TEXT = "Start pushing button to see some comments"
    
    private let commentLabel = UILabel()
    private let valueLabel = UILabel()
    private var value: Int = 0
    private let incrementButton = UIButton()
    private var commentView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .lightGray
        setupIncrementButton()
        setupValueLabel()
        commentView = setupCommentView()
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
    
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = COMMENT_VIEW_CORNER_RADIUS
        view.addSubview(commentView)
        commentView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        commentView.pin(to: view, [.left: 24, .right: 24])
        commentLabel.font = .systemFont(ofSize: COMMENT_VIEW_FONT_SIZE, weight: .regular)
        commentLabel.text = COMMENT_VIEW_DEFAULT_TEXT
        commentLabel.textColor = .systemGray
        commentLabel.numberOfLines = 0
        commentLabel.textAlignment = .center
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        return commentView
    }
}

