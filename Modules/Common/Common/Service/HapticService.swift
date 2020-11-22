//
//  HapticService.swift
//  Common
//
//  Created by Windy on 20/11/20.
//

import UIKit

public class HapticService {
    
    public static let shared = HapticService()
    
    public func simpleHaptic() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
}
