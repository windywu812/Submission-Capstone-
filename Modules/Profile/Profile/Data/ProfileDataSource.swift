//
//  ProfileDataSource.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation
import Common

public protocol ProfileDataSourceProtocol {
    func getProfileData() -> ProfileResponse
}

public class ProfileDataSource {
    public static let shared = ProfileDataSource()
}

extension ProfileDataSource: ProfileDataSourceProtocol {
    public func getProfileData() -> ProfileResponse {
        return ProfileResponse(
            image: UserDefaultService.image,
            name: UserDefaultService.name,
            expert: UserDefaultService.expert,
            email: UserDefaultService.email,
            education: UserDefaultService.education,
            number: UserDefaultService.phoneNumber,
            location: UserDefaultService.location,
            achievement: UserDefaultService.achievement,
            hobby: UserDefaultService.hobby,
            linkedin: UserDefaultService.linkedIn,
            github: UserDefaultService.github)
    }
    
}
