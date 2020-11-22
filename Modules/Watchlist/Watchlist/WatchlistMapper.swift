//
//  WatchlistMapper.swift
//  Watchlist
//
//  Created by Windy on 22/11/20.
//

import Foundation
import Core
import Common

class WatchlistMapper: GenericMapper {
    
    typealias Response = [Watchlist]
    typealias Entity = [WatchlistEntity]
    typealias Domain = [WatchlistModel]
    
    static func mapResponseToEntity(response: [Watchlist]) -> [WatchlistEntity] {
        return response.map { response in
             return WatchlistEntity(
                 idMovie: Int(response.idMovie),
                 overview: response.overview ?? "",
                 popularity: response.popularity,
                 posterPath: response.posterPath ?? "",
                 releaseDate: response.releaseDate ?? "",
                 title: response.title ?? "")
         }
    }
    
    static func mapEntityToDomain(entity: [WatchlistEntity]) -> [WatchlistModel] {
        return entity.map { response in
             return WatchlistModel(
                 idMovie: Int(response.idMovie),
                 overview: response.overview,
                 popularity: response.popularity,
                 posterPath: response.posterPath,
                 releaseDate: response.releaseDate,
                 title: response.title)
         }
    }
   
}
