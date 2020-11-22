//
//  ProfilePresenter.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

public class ProfilePresenter {
    
    let interactor: ProfileUseCase
    
    public let profile: ProfileModel
    
    public init(interactor: ProfileUseCase) {
        self.interactor = interactor
        
        profile = interactor.getProfile()
    }
    
    public func getLabel() -> [String] {
        interactor.getLabel()
    }
    
    public func getProfile() -> [String] {
        return [profile.email, profile.education, profile.number,
                profile.location, profile.achievement, profile.hobby,
                profile.linkedin, profile.github]
    }
    
}
