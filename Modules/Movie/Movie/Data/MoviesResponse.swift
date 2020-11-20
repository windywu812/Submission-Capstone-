//
//  MovieResponse.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import Foundation

public struct MoviesResponse: Codable {
    public let results: [MovieResponse]
}

public struct MovieResponse: Codable {
    public let idMovie: Int
    public let title: String
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    public let releaseDate: String?
    public let popularity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview, popularity
        case idMovie = "id"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}
