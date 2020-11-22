//
//  String+Localization.swift
//  Common
//
//  Created by Windy on 22/11/20.
//

import Foundation

extension String {
    public func localized(identifier: String) -> String {
        let bundle = Bundle(identifier: identifier) ?? .main
        return bundle.localizedString(forKey: self, value: nil, table: nil)
    }
}
