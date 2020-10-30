//
//  Array+ext.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation

extension Array {
    
    func convertArraytoString() -> String {
        
        var container: String = ""
        
        if self.count == 1 {
            self.forEach { (string) in
                guard let string = string as? String else { return }
                container = string
            }
        } else {
            self.forEach { (string) in
                guard let string = string as? String else { return }
                container.append("\(string), ")
            }
        }
        
        return container
    }
    
}
