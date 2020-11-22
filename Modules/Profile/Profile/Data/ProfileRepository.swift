//
//  ProfileRepository.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation

public protocol ProfileRepositoryProtocol {
    func getProfileData() -> ProfileEntity
}

public class ProfileRepository {
    
    public typealias ProfileInstance = (ProfileDataSource) -> ProfileRepository
    public let remote: ProfileDataSource
    
    private init(remote: ProfileDataSource) {
        self.remote = remote
    }
    
    public static let sharedInstance: ProfileInstance = { remote in
        return ProfileRepository(remote: remote)
    }
    
}

extension ProfileRepository: ProfileRepositoryProtocol {
    
    public func getProfileData() -> ProfileEntity {
        return ProfileMapper.mapResponseToEntity(response: remote.getProfileData())
    }
    
}
