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

    static func mapResponseToProfileEntity(input response: ProfileResponse) -> ProfileEntity {
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
    
    static func mapResponseToProfileModel(input response: ProfileEntity) -> ProfileModel {
        return ProfileModel(
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
    
    static func mapResponseToWatchlistEntity(input response: [Watchlist]) -> [WatchlistEntity] {
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
    
    static func mapResponseToWatchlistModel(input entity: [WatchlistEntity]) -> [WatchlistModel] {
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
