//
//  MainInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import RxSwift
import Foundation

protocol MainInteractorUseCase {
    func getNowPlayingMovies() -> Observable<[MovieModel]>
    func getTopRatedMovies() -> Observable<[MovieModel]>
    func getUpcomingMovies() -> Observable<[MovieModel]>
    func getPopularMovies() -> Observable<[MovieModel]>
}

class HomeUseCase: MainInteractorUseCase {

    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getNowPlayingMovies() -> Observable<[MovieModel]> {
        return repository.getNowPlayingMovies()
    }
    
    func getTopRatedMovies() -> Observable<[MovieModel]> {
        return repository.getTopRatedMovies()
    }
    
    func getUpcomingMovies() -> Observable<[MovieModel]> {
        return repository.getUpcomingMovies()
    }
    
    func getPopularMovies() -> Observable<[MovieModel]> {
        return repository.getPopularMovies()
    }
    
}
