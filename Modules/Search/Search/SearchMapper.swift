//
//  SearchMapper.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import Core
import Common

class SearchMapper: GenericMapper {
    
    typealias Response = [SearchResponse]
    typealias Entity = [SearchEntity]
    typealias Domain = [SearchModel]
    
    static func mapResponseToEntity(response: [SearchResponse]) -> [SearchEntity] {
        return response.map({ response in
            return SearchEntity(
                idMovie: response.idMovie,
                title: response.title,
                posterPath: "\(API.imageLoaderURL)\(response.posterPath ?? "")",
                backdropPath: "\(API.imageLoaderURL)\(response.backdropPath ?? "")",
                overview: response.overview ?? "",
                releaseDate: response.releaseDate?.changeDateFormat() ?? "-",
                popularity: response.popularity ?? 0)
        })
    }
    
    static func mapEntityToDomain(entity: [SearchEntity]) -> [SearchModel] {
        return entity.map({ response in
            return SearchModel(
                idMovie: response.idMovie,
                title: response.title,
                posterPath: response.posterPath,
                backdropPath: response.backdropPath,
                overview: response.overview,
                releaseDate: response.releaseDate.changeDateFormat() ?? "",
                popularity: response.popularity)
        })
    }
    
}
