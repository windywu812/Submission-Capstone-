//
//  UserDefaultServices.swift
//  Common
//
//  Created by Windy on 20/11/20.
//

import Foundation

public class UserDefaultService {
    
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
    
    public static var image: String {
        get {
            return UserDefaults.standard.string(forKey: imageKey) ?? "profile"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: imageKey)
        }
    }
    
    public static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? "Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    public static var expert: String {
        get {
            return UserDefaults.standard.string(forKey: expertKey) ?? "iOS Developer"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: expertKey)
        }
    }
    
    public static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? "windywu812@gmail.com"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    public static var education: String {
        get {
            return UserDefaults.standard.string(forKey: educationKey) ?? "Information System"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: educationKey)
        }
    }
    
    public static var phoneNumber: String {
        get {
            return UserDefaults.standard.string(forKey: phoneNumberKey) ?? "089647527757"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: phoneNumberKey)
        }
    }
    
    public static var location: String {
        get {
            return UserDefaults.standard.string(forKey: locationKey) ?? "Batam"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: locationKey)
        }
    }
    
    public static var achievement: String {
        get {
            return UserDefaults.standard.string(forKey: achievementKey) ?? "Dicoding Graduate"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: achievementKey)
        }
    }
    
    public static var hobby: String {
        get {
            return UserDefaults.standard.string(forKey: hobbyKey) ?? "Coding"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hobbyKey)
        }
    }
    
    public static var linkedIn: String {
        get {
            return UserDefaults.standard.string(forKey: linkedinKey) ?? "Windy Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: linkedinKey)
        }
    }
    
    public static var github: String {
        get {
            return UserDefaults.standard.string(forKey: githubKey) ?? "http://github.com/windywu812"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: githubKey)
        }
    }
    
}

