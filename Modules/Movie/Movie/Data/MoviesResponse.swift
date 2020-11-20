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
    let idMovie: Int
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let overview: String?
    let releaseDate: String?
    let popularity: Double?
    
    private enum CodingKeys: String, CodingKey {
        case title, overview, popularity
        case idMovie = "id"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}
