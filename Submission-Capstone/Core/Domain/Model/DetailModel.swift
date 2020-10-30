//
//  DetailModel.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation

struct DetailModel {
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
    let spokenLanguages: [String]
    let productionCompanies: [String]
    let genres: [String]
    let runtime: Double
}
