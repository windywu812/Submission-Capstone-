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
    let releaseDate: String
    let popularity: Double
    let posterPath: String?
    let backdropPath: String?
    let overview: String
    
    private enum CodingKeys: String, CodingKey {
        case title, popularity, overview
        case idMovie = "id"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
