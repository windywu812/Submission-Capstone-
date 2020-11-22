//
//  SeeAllModel.swift
//  SeeAll
//
//  Created by Windy on 22/11/20.
//

import Foundation

public struct SeeAllModel {
    public let idMovie: Int
    public let title: String
    public let posterPath: String
    public let backdropPath: String
    public let overview: String
    public let releaseDate: String
    public let popularity: Double
    
    public init(idMovie: Int, title: String, posterPath: String, backdropPath: String, overview: String, releaseDate: String, popularity: Double) {
        self.idMovie = idMovie
        self.title = title
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
        self.releaseDate = releaseDate
        self.popularity = popularity
    }
}
