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
    let tagline: String
    let overview: String
    let popularity: Double
    let releaseDate: String
    let backdropPath: String?
    
    private enum CodingKeys: String, CodingKey {
        case idMovie = "id"
        case title, tagline, overview, popularity
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }
}
