//
//  MovieMapper.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import UIKit

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
    
    static func mapResponseToDetailEntity(input response: DetailResponse) -> DetailEntity {
        return DetailEntity(
            idMovie: response.idMovie,
            title: response.title,
            tagline: (response.tagline?.isEmpty == true ? "No tagline" : response.tagline) ?? "",
            overview: response.overview ?? "No overview",
            popularity: response.popularity,
            releaseDate: response.releaseDate,
            backdropPath: "\(API.imageLoaderURL)\(response.backdropPath ?? "")",
            status: response.status,
            voteAverage: response.voteAverage,
            voteCount: response.voteCount,
            spokenLanguages: response.spokenLanguages.map({ return $0.name }),
            productionCompanies: response.productionCompanies.map({ return $0.name }),
            genres: response.genres.map({ return $0.name }),
            runtime: response.runtime,
            posterPath: response.posterPath)
    }
    
    static func mapEntityToDetailModel(input entity: DetailEntity) -> DetailModel {
        return DetailModel(
            idMovie: entity.idMovie,
            title: entity.title,
            tagline: entity.tagline,
            overview: entity.overview,
            popularity: entity.popularity,
            releaseDate: entity.releaseDate,
            backdropPath: entity.backdropPath,
            status: entity.status,
            voteAverage: entity.voteAverage,
            voteCount: entity.voteCount,
            spokenLanguages: entity.spokenLanguages,
            productionCompanies: entity.productionCompanies,
            genres: entity.genres,
            runtime: entity.runtime,
            posterPath: entity.posterPath)
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
    
    static func mapModelToWatchlistEnity(input model: DetailModel) -> DetailEntity {
        return DetailEntity(
            idMovie: model.idMovie,
            title: model.title,
            tagline: "",
            overview: model.overview,
            popularity: model.popularity,
            releaseDate: model.releaseDate,
            backdropPath: "",
            status: "",
            voteAverage: 0,
            voteCount: 0,
            spokenLanguages: [],
            productionCompanies: [],
            genres: [],
            runtime: 0,
            posterPath: model.posterPath)
    }
    
    static func mapEntityToDetailResponse(input model: DetailEntity) -> DetailResponse {
        return DetailResponse(
            idMovie: model.idMovie,
            title: model.title,
            tagline: "",
            overview: model.overview,
            popularity: model.popularity,
            releaseDate: model.releaseDate,
            backdropPath: "",
            status: "",
            voteAverage: 0,
            voteCount: 0,
            spokenLanguages: [],
            productionCompanies: [],
            genres: [],
            runtime: 0,
            posterPath: model.posterPath)
    }
}
