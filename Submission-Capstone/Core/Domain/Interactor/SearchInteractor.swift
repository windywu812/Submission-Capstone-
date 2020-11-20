//
//  SearchInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation
import RxSwift
import Movie

protocol SearchUseCase {
    func getListMovies(keyword: String) -> Observable<[MovieModel]>
}

class SearchInteractor: SearchUseCase {
    
    private let repository: SearchMoviesRepositoryProtocol
    
    init(repository: SearchMoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getListMovies(keyword: String) -> Observable<[MovieModel]> {
        return repository.getListMovies(keyword: keyword).map({
            MovieMapper.mapEntityToMovieModel(input: $0)
        })
    }
    
}
