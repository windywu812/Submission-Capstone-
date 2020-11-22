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
        return ["Email",
                "education".localized(identifier: "com.windy.Common"),
                "number".localized(identifier: "com.windy.Common"),
                "location".localized(identifier: "com.windy.Common"),
                "achievement".localized(identifier: "com.windy.Common"),
                "hobby".localized(identifier: "com.windy.Common"),
                "LinkedIn",
                "Github"]
    }
    
}
