//
//  MovieMapper.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import Foundation
import Core
import Common
import SeeAll

public struct MovieMapper: GenericMapper {
    
    public typealias Response = [MovieResponse]
    public typealias Entity = [MovieEntity]
    public typealias Domain = [MovieModel]
    
    public static func mapResponseToEntity(response: [MovieResponse]) -> [MovieEntity] {
        return response.map({ response in
            return MovieEntity(
                idMovie: response.idMovie,
                title: response.title,
                posterPath: "\(API.imageLoaderURL)\(response.posterPath ?? "")",
                backdropPath: "\(API.imageLoaderURL)\(response.backdropPath ?? "")",
                overview: response.overview ?? "",
                releaseDate: response.releaseDate?.changeDateFormat() ?? "-",
                popularity: response.popularity ?? 0)
        })
    }
    
    public static func mapEntityToDomain(entity: [MovieEntity]) -> [MovieModel] {
        return entity.map({ response in
            return MovieModel(
                idMovie: response.idMovie,
                title: response.title,
                posterPath: response.posterPath,
                backdropPath: response.backdropPath,
                overview: response.overview,
                releaseDate: response.releaseDate.changeDateFormat() ?? "",
                popularity: response.popularity)
        })
    }
    
    public static func mapMovieToSeeAll(movies: [MovieModel]) -> [SeeAllModel] {
        return movies.map { movie in
            return SeeAllModel(
                idMovie: movie.idMovie,
                title: movie.title,
                posterPath: movie.posterPath,
                backdropPath: movie.backdropPath,
                overview: movie.overview,
                releaseDate: movie.releaseDate.changeDateFormat() ?? "",
                popularity: movie.popularity)
        }
    }
    
}
