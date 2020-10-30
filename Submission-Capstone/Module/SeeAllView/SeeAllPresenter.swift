//
//  SeeAllPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation

class SeeAllPresenter {
    
    private let interactor: SeeAllUseCase
    
    var movies: [MovieModel] = []
    
    init(interactor: SeeAllUseCase) {
        self.interactor = interactor
        
        getMovie()
    }
    
    private func getMovie() {
        movies = interactor.getAllMovies()
    }
    
}
