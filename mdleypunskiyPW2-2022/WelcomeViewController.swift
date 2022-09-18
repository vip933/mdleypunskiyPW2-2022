//
//  ViewController.swift
//  mdleypunskiyPW2-2022
//
//  Created by Maxim Leypunskiy on 17/09/2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private static let INC_BUTTON_CORNER_RADIUS: CGFloat = 12
    private static let INC_BUTTON_FONT_SIZE: CGFloat = 25
    private static let INC_BUTTON_TEXT = "Push me"
    
    private static let VALUE_LABEL_FONT_SIZE: CGFloat = 40
    
    private static let COMMENT_VIEW_CORNER_RADIUS: CGFloat = 12
    private static let COMMENT_VIEW_FONT_SIZE: CGFloat = 16
    private static let COMMENT_VIEW_DEFAULT_TEXT = "Start pushing button to see some comments"
    
    private let commentLabel = UITextView()
    private let valueLabel = UILabel()
    private var value: Int = 0
    private let incrementButton = UIButton()
    private var commentView: UIView?
    
    private var colorsButton: UIButton?
    private var notesButton: UIButton?
    private var newsButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupUI() {
        view.backgroundColor = .systemGray6
        setupIncrementButton()
        setupValueLabel()
        commentView = setupCommentView()
        setupMenuButtons()
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle(WelcomeViewController.INC_BUTTON_TEXT, for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = WelcomeViewController.INC_BUTTON_CORNER_RADIUS
        incrementButton.titleLabel?.font = .systemFont(ofSize: WelcomeViewController.INC_BUTTON_FONT_SIZE, weight: .medium)
        incrementButton.backgroundColor = .white
        //incrementButton.layer.applyShadow()
        view.addSubview(incrementButton)
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: view.centerYAnchor)
        incrementButton.pin(to: view, [.left: 24, .right: 24])
        incrementButton.addTarget(self, action: #selector(incrementButtonPressed), for: .touchUpInside)
    }
                                        
    private func setupValueLabel() {
        valueLabel.font = .systemFont(ofSize: WelcomeViewController.VALUE_LABEL_FONT_SIZE, weight: .bold)
        valueLabel.textColor = .black
        valueLabel.text = "\(value)"
        view.addSubview(valueLabel)
        valueLabel.pinBottom(to: incrementButton.topAnchor, 16)
        valueLabel.pinCenter(to: view.centerXAnchor)
    }
    
    private func setupMenuButtons() {
        let colorsButton = UIButton.makeCustomMenuButton(title: "🎨")
        colorsButton.addTarget(self, action: #selector(bottomButtonWasPressedStartHapticResponse), for: .touchUpInside)
        self.colorsButton = colorsButton
        
        let notesButton = UIButton.makeCustomMenuButton(title: "📝")
        notesButton.addTarget(self, action: #selector(bottomButtonWasPressedStartHapticResponse), for: .touchUpInside)
        self.notesButton = notesButton
        
        let newsButton = UIButton.makeCustomMenuButton(title: "📰")
        newsButton.addTarget(self, action: #selector(bottomButtonWasPressedStartHapticResponse), for: .touchUpInside)
        self.newsButton = newsButton
    
        let buttonsSV = UIStackView(arrangedSubviews: [colorsButton, notesButton, newsButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .horizontal
        buttonsSV.distribution = .fillEqually
        view.addSubview(buttonsSV)
        buttonsSV.pin(to: view, [.left: 24, .right: 24])
        buttonsSV.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, 24)
    }
    
    @objc
    private func bottomButtonWasPressedStartHapticResponse() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
    @objc
    private func incrementButtonPressed() {
        value += 1
        let generatorLight = UIImpactFeedbackGenerator(style: .light)
        let generatorHeavy = UIImpactFeedbackGenerator(style: .heavy)
        if value % 10 == 0 {
            generatorHeavy.impactOccurred()
        } else {
            generatorLight.impactOccurred()
        }
        UIView.animate(withDuration: 1) {
            self.updateUI()
        }
    }
    
    private func updateUI() {
        valueLabel.text = "\(value)"
        updateCommentLabel(value: value)
    }
    
    private func setupCommentView() -> UIView {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentLabel.isEditable = false
        commentView.layer.cornerRadius = WelcomeViewController.COMMENT_VIEW_CORNER_RADIUS
        view.addSubview(commentView)
        commentView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        commentView.pin(to: view, [.left: 24, .right: 24])
        commentLabel.font = .systemFont(ofSize: WelcomeViewController.COMMENT_VIEW_FONT_SIZE, weight: .regular)
        commentLabel.text = WelcomeViewController.COMMENT_VIEW_DEFAULT_TEXT
        commentLabel.textColor = .systemGray
        commentLabel.textAlignment = .center
        commentLabel.isScrollEnabled = false
        commentView.addSubview(commentLabel)
        commentLabel.pin(to: commentView, [.top: 16, .left: 16, .bottom: 16, .right: 16])
        return commentView
    }
    
    func updateCommentLabel(value: Int) {
        
        switch value {
        case 0...10:
            commentLabel.text = "1"
        case 10...20:
            commentLabel.text = "2"
        case 20...30:
            commentLabel.text = "3"
        case 30...40:
            commentLabel.text = "4"
        case 40...50:
            commentLabel.text = "🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉"
        case 50...60:
            commentLabel.text = "big boy"
        case 60...70:
            commentLabel.text = "70 70 70 moreeeee"
        case 70...80:
            commentLabel.text = "⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐"
        case 80...90:
            commentLabel.text = "80+\n go higher!"
        case 90...100:
            commentLabel.text = "100!! to the moon!!"
        case 100...110:
            commentLabel.text = "wow, 110, you should stop immediately!"
        case 110...120:
            commentLabel.text = "c'mon, you've reached 120, you will see nothing new"
        case 120...130:
            commentLabel.text = "130, bro plz sto"
        case 140...150:
            let path = "https://preview.redd.it/s4ncdb4js9g81.jpg?auto=webp&s=19927b7dc5337560e010769369968da7018b0fcf"
            let text = "omg, you've found an eastern egg, click!"
            let attributedString = NSAttributedString.makeHyperlink(for: path, in: text, as: "click")
            commentLabel.attributedText = attributedString
        default:
            break
        }
    }
}

extension WelcomeViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}

