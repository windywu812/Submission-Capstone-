//
//  MovieMapper.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation

class MovieMapper {
    
    static func mapResponseToMovieModel(input moviesResponse: [MovieResponse]) -> [MovieModel] {
        return moviesResponse.map({ response in
            return MovieModel(
                idMovie: response.idMovie,
                title: response.title,
                posterPath: "\(API.imageLoaderURL)\(response.posterPath ?? "")",
                backdropPath: "\(API.imageLoaderURL)\(response.backdropPath ?? "")",
                overview: response.overview,
                releaseDate: response.releaseDate.changeDateFormat() ?? "-",
                popularity: response.popularity)
        })
    }
    
    static func mapResponseDetailToDetailModel(input response: DetailResponse) -> DetailModel {
        return DetailModel(
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
    
    static func mapResponseToProfileModel(input response: ProfileResponse) -> ProfileModel {
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
    
}
