//
//  MovieResponse.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation

struct MoviesResponse: Codable {
    let results: [MovieResponse]
}

struct MovieResponse: Codable {
    let idMovie: Int
    let title: String
    let posterPath: String?
    let backdropPath: String?
    let overview: String
    let releaseDate: String
    let popularity: Double
    
    private enum CodingKeys: String, CodingKey {
        case title, overview, popularity
        case idMovie = "id"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}
