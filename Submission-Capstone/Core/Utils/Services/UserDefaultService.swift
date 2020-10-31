//
//  UserDefaultService.swift
//  Submission-Capstone
//
//  Created by Windy on 31/10/20.
//

import Foundation

class UserDefaultService {
    
    static private let imageKey = "imageKey"
    static private let nameKey = "nameKey"
    static private let expertKey = "expertKey"
    static private let emailKey = "emailKey"
    static private let educationKey = "educationKey"
    static private let phoneNumberKey = "phoneNumberKey"
    static private let locationKey = "locationKey"
    static private let achievementKey = "achievementKey"
    static private let hobbyKey = "hobbyKey"
    static private let linkedinKey = "linkedinKey"
    static private let githubKey = "githubKey"
    
    static var image: String {
        get {
            return UserDefaults.standard.string(forKey: imageKey) ?? "profile"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: imageKey)
        }
    }
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? "Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var expert: String {
        get {
            return UserDefaults.standard.string(forKey: expertKey) ?? "iOS Developer"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: expertKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? "windywu812@gmail.com"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    static var education: String {
        get {
            return UserDefaults.standard.string(forKey: educationKey) ?? "Information System"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: educationKey)
        }
    }
    
    static var phoneNumber: String {
        get {
            return UserDefaults.standard.string(forKey: phoneNumberKey) ?? "089647527757"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: phoneNumberKey)
        }
    }
    
    static var location: String {
        get {
            return UserDefaults.standard.string(forKey: locationKey) ?? "Batam"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: locationKey)
        }
    }
    
    static var achievement: String {
        get {
            return UserDefaults.standard.string(forKey: achievementKey) ?? "Dicoding Graduate"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: achievementKey)
        }
    }
    
    static var hobby: String {
        get {
            return UserDefaults.standard.string(forKey: hobbyKey) ?? "Coding"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hobbyKey)
        }
    }
    
    static var linkedIn: String {
        get {
            return UserDefaults.standard.string(forKey: linkedinKey) ?? "Windy Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: linkedinKey)
        }
    }
    
    static var github: String {
        get {
            return UserDefaults.standard.string(forKey: githubKey) ?? "http://github.com/windywu812"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: githubKey)
        }
    }
    
}
