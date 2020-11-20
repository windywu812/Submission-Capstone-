//
//  HomeInteractor.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import RxSwift
import Core
import Foundation
import Common

protocol HomeUseCase {
    func getNowPlayingMovies() -> Observable<[MovieModel]>
    func getTopRatedMovies() -> Observable<[MovieModel]>
    func getUpcomingMovies() -> Observable<[MovieModel]>
    func getPopularMovies() -> Observable<[MovieModel]>
}

class HomeInteractor: HomeUseCase {
    
    private let repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getNowPlayingMovies() -> Observable<[MovieModel]> {
        return repository.getNowPlayingMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })
    }
    
    func getTopRatedMovies() -> Observable<[MovieModel]> {
        return repository.getTopRatedMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })
    }
    
    func getUpcomingMovies() -> Observable<[MovieModel]> {
        return repository.getUpcomingMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })

    }
    
    func getPopularMovies() -> Observable<[MovieModel]> {
        return repository.getPopularMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })

    }
    
}

