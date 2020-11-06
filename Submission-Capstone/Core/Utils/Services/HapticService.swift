//
//  HapticManager.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import UIKit

class HapticService {
    
    static let shared = HapticService()
    
    func simpleHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
}
