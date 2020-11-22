//
//  MovieMapper.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import UIKit
import Common
import Movie

class MovieMapper {
    
    static func mapResponseToMovieEntity(input response: [MovieResponse]) -> [MovieEntity] {
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
    
    static func mapEntityToMovieModel(input entity: [MovieEntity]) -> [MovieModel] {
        return []
//        return entity.map({ response in
//            return []
//            return MovieModel(
//                idMovie: response.idMovie,
//                title: response.title,
//                posterPath: response.posterPath,
//                backdropPath: response.backdropPath,
//                overview: response.overview,
//                releaseDate: response.releaseDate.changeDateFormat() ?? "",
//                popularity: response.popularity)
//        })
    }

}
