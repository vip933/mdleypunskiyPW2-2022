//
//  NSAttributedString+Hyperlink.swift
//  mdleypunskiyPW2-2022
//
//  Created by Maxim Leypunskiy on 17/09/2022.
//

import UIKit

extension NSAttributedString {
    private static let COMMENT_VIEW_FONT_SIZE: CGFloat = 16
    
    static func makeHyperlink(for path: String, in string: String, as substing: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substing)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        let attrs = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: COMMENT_VIEW_FONT_SIZE, weight: .regular),
            .paragraphStyle : paragraph,
            NSAttributedString.Key.foregroundColor: UIColor.systemGray
        ]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attrs)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
}
