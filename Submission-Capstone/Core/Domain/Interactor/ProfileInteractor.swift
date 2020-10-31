//
//  ProfileInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 31/10/20.
//

import Foundation

protocol ProfileUseCase {
    func getProfile() -> ProfileModel
}

class ProfileInteractor: ProfileUseCase {
    
    private let repository: ProfileRepository
    
    init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    func getProfile() -> ProfileModel {
        return repository.getProfileData()
    }
    
}
