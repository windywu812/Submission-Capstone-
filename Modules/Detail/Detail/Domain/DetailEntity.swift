//
//  DetailEntity.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import Foundation

public struct DetailEntity {
    public let idMovie: Int
    public let title: String
    public let tagline: String
    public let overview: String
    public let popularity: Double
    public let releaseDate: String
    public let backdropPath: String
    public let status: String
    public let voteAverage: Double
    public let voteCount: Double
    public let spokenLanguages: [String]
    public let productionCompanies: [String]
    public let genres: [String]
    public let runtime: Double
    public let posterPath: String
}
