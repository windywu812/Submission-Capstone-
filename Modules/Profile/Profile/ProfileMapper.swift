//
//  Mapper.swift
//  Profile
//
//  Created by Windy on 20/11/20.
//

import Foundation
import Core

public class ProfileMapper: GenericMapper {
     
    public typealias Response = ProfileResponse
    public typealias Entity = ProfileEntity
    public typealias Domain = ProfileModel
    
    public static func mapResponseToEntity(response: ProfileResponse) -> ProfileEntity {
        return ProfileEntity(
            image: response.image,
            name: response.name,
            expert: response.expert,
            email: response.email,
            education: response.education,
            number: response.number,
            location: response.location,
            achievement: response.achievement,
            hobby: response.hobby,
            linkedin: response.linkedin,
            github: response.github)
    }
    
    public static func mapEntityToDomain(entity: ProfileEntity) -> ProfileModel {
        return ProfileModel(
            image: entity.image,
            name: entity.name,
            expert: entity.expert,
            email: entity.email,
            education: entity.education,
            number: entity.number,
            location: entity.location,
            achievement: entity.achievement,
            hobby: entity.hobby,
            linkedin: entity.linkedin,
            github: entity.github)
    }
    
}
