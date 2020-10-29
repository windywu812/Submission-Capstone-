//
//  NSAttributedString+ext.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

extension NSAttributedString {
    
    static func setFont(
        text: String,
        fontSize: CGFloat,
        color: UIColor,
        weight: UIFont.Weight) -> NSAttributedString {
        
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: weight),
                NSAttributedString.Key.foregroundColor: color
            ]) 
    }
    
}
