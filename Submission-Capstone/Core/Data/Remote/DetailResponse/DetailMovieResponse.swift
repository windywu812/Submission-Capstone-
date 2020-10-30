//
//  DetailMovieResponse.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation

struct DetailResponse: Codable {
    let idMovie: Int
    let title: String
    let tagline: String?
    let overview: String?
    let popularity: Double
    let releaseDate: String
    let backdropPath: String?
    let status: String
    let voteAverage: Double
    let voteCount: Double
    let spokenLanguages: [Language]
    let productionCompanies: [Company]
    let genres: [Genre]
    let runtime: Double
    
    struct Language: Codable {
        let name: String
    }
    
    struct Company: Codable {
        let name: String
    }
    
    struct Genre: Codable {
        let name: String
    }
    
    private enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case title, tagline, overview, popularity, status, genres, runtime
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case spokenLanguages = "spoken_languages"
        case productionCompanies = "production_companies"
    }
    
}
