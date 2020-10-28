//
//  MovieMapper.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation

class MovieMapper {
    
    static func mapResponseToMovieModel(input moviesResponse: [MovieResponse]) -> [MovieModel] {
        return moviesResponse.map({ response in
            return MovieModel(
                idMovie: response.idMovie,
                title: response.title,
                releaseDate: response.releaseDate,
                popularity: response.popularity,
                posterPath: response.posterPath ?? "",
                backdropPath: response.backdropPath ?? "",
                overview: response.overview)
        })
    }
    
}
