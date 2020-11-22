//
//  String+Extensions.swift
//  Common
//
//  Created by Windy on 20/11/20.
//

import Foundation

public extension String {
    
    func changeDateFormat() -> String? {
        
        let formatterFromJSON = DateFormatter()
        formatterFromJSON.dateFormat = "yyyy-mm-dd"
        
        let date = formatterFromJSON.date(from: self)
        
        let formatterToDate = DateFormatter()
        formatterToDate.dateFormat = "MMM dd, yyyy"
        
        if let date = date {
            return formatterToDate.string(from: date)
        }
        
        return nil
    }
    
}
