//
//  Mapper.swift
//  Core
//
//  Created by Windy on 20/11/20.
//

import Foundation

public protocol Mapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    static func mapResponseToEntity(response: Response) -> Entity
    static func mapEntityToDomain(entity: Entity) -> Domain
}
