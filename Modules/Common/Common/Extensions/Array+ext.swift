//
//  Array+ext.swift
//  Common
//
//  Created by Windy on 22/11/20.
//

import Foundation

public extension Array {
    
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
                container.append("\(string)\n")
            }
        }
        
        return container
    }
    
}
