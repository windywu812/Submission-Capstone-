//
//  ProfilePresenter.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

public class ProfilePresenter {
    
    let interactor: ProfileUseCase
    
    public var profile: ProfileModel
    
    public init(interactor: ProfileUseCase) {
        self.interactor = interactor
        
        profile = interactor.getProfile()
    }
    
}
