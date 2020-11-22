//
//  ProfileInteractor.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

public protocol ProfileUseCase {
    func getProfile() -> ProfileModel
}

public class ProfileInteractor: ProfileUseCase {
    
    private let repository: ProfileRepository
    
    public init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    public func getProfile() -> ProfileModel {
        ProfileMapper.mapEntityToDomain(entity: repository.getProfileData())
    }
    
}
