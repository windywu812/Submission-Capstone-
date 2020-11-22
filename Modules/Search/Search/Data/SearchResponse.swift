//
//  SearchResponse.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import Foundation

public struct SearchMoviesResponse: Codable {
    public let results: [SearchResponse]
}

public struct SearchResponse: Codable {
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
