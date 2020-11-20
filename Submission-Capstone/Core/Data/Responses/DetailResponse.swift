//
//  DetailResponse.swift
//  Submission-Capstone
//
//  Created by Windy on 20/11/20.
//

import Foundation

public struct DetailResponse: Codable {
    public let idMovie: Int
    public let title: String
    public let tagline: String?
    public let overview: String?
    public let popularity: Double
    public let releaseDate: String
    public let backdropPath: String?
    public let status: String
    public let voteAverage: Double
    public let voteCount: Double
    public let spokenLanguages: [Language]
    public let productionCompanies: [Company]
    public let genres: [Genre]
    public let runtime: Double
    public let posterPath: String
    
    public struct Language: Codable {
        public let name: String
    }
    
    public struct Company: Codable {
        public let name: String
    }
    
    public struct Genre: Codable {
        public let name: String
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
        case posterPath = "poster_path"
    }
    
}
