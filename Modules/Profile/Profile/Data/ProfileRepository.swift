//
//  ProfileRepository.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

protocol ProfileRepositoryProtocol {
    func getProfileData() -> ProfileEntity
}

class ProfileRepository {
    
    typealias ProfileInstance = (ProfileDataSource) -> ProfileRepository
    let remote: ProfileDataSource
    
    private init(remote: ProfileDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: ProfileInstance = { remote in
        return ProfileRepository(remote: remote)
    }
    
}

extension ProfileRepository: ProfileRepositoryProtocol {
    
    func getProfileData() -> ProfileEntity {
        return ProfileMapper.mapResponseToEntity(response: remote.getProfileData())
    }
    
}
