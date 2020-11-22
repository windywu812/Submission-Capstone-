//
//  NSAttributedString+ext.swift
//  Common
//
//  Created by Windy on 22/11/20.
//

import UIKit

public extension NSAttributedString {

    static func bodyFont(text: String, color: UIColor = .label) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .regular),
                NSAttributedString.Key.foregroundColor: color
            ])
    }
    
    static func headlineFont(text: String, color: UIColor = .label) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold),
                NSAttributedString.Key.foregroundColor: color
            ])
    }
    
    static func title3Font(text: String, color: UIColor = .label) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold),
                NSAttributedString.Key.foregroundColor: color
            ])
    }
    
    static func title2Font(text: String, color: UIColor = .label) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22, weight: .bold),
                NSAttributedString.Key.foregroundColor: color
            ])
    }
    
    static func title1Font(text: String, color: UIColor = .label) -> NSAttributedString {
        return NSAttributedString(
            string: text,
            attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 28, weight: .bold),
                NSAttributedString.Key.foregroundColor: color
            ])
    }
    
}
