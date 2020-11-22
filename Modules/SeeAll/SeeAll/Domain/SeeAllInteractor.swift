//
//  SeeAllInteractor.swift
//  SeeAll
//
//  Created by Windy on 22/11/20.
//

import Foundation

public protocol SeeAllUseCase {
    func getAllMovies() -> [SeeAllModel]
}

public class SeeAllInteractor: SeeAllUseCase {
    
    private var movies: [SeeAllModel] = []
    
    public init(movies: [SeeAllModel]) {
        self.movies = movies
    }
    
    public func getAllMovies() -> [SeeAllModel] {
        return movies
    }
    
}
