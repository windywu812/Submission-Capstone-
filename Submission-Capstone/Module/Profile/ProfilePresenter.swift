//
//  ProfilePresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation

class ProfilePresenter {
    
    private let interactor: ProfileUseCase
    
    var profile: ProfileModel
    
    init(interactor: ProfileUseCase) {
        self.interactor = interactor
        
        profile = interactor.getProfile()
    }
    
}
