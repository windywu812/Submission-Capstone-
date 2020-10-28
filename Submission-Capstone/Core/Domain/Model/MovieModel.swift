//
//  MovieModel.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation

struct MovieModel: Codable {
    let idMovie: Int
    let title: String
    let releaseDate: String
    let popularity: Double
    let posterPath: String
    let backdropPath: String
    let overview: String
}
