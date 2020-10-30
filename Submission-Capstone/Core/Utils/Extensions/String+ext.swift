//
//  String+ext.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation

extension String {
    
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
