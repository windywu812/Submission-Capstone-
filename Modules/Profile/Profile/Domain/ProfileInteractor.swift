//
//  ProfileInteractor.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

public protocol ProfileUseCase {
    func getProfile() -> ProfileModel
    func getLabel() -> [String]
}

public class ProfileInteractor: ProfileUseCase {
    
    private let repository: ProfileRepository
    
    public init(repository: ProfileRepository) {
        self.repository = repository
    }
    
    public func getProfile() -> ProfileModel {
        ProfileMapper.mapEntityToDomain(entity: repository.getProfileData())
    }
    
    public func getLabel() -> [String] {
        return ["Email", "Education", "Number", "Location", "Achievement", "Hobby", "LinkedIn", "Github"]
    }
    
}
