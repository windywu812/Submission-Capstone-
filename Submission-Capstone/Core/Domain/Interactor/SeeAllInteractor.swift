//
//  SeeAllInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation

protocol SeeAllUseCase {
    func getAllMovies() -> [MovieModel]
}

class SeeAllInteractor: SeeAllUseCase {
    
    private let movies: [MovieModel]
    
    init(movies: [MovieModel]) {
        self.movies = movies
    }
    
    func getAllMovies() -> [MovieModel] {
        return movies
    }
    
}
