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

public protocol MovieUseCase {
    func getNowPlayingMovies() -> Observable<[MovieModel]>
    func getTopRatedMovies() -> Observable<[MovieModel]>
    func getUpcomingMovies() -> Observable<[MovieModel]>
    func getPopularMovies() -> Observable<[MovieModel]>
}

public class MovieInteractor: MovieUseCase {
    
    private let repository: MoviesRepositoryProtocol
    
    public init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getNowPlayingMovies() -> Observable<[MovieModel]> {
        return repository.getNowPlayingMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })
    }
    
    public func getTopRatedMovies() -> Observable<[MovieModel]> {
        return repository.getTopRatedMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })
    }
    
    public func getUpcomingMovies() -> Observable<[MovieModel]> {
        return repository.getUpcomingMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })

    }
    
    public func getPopularMovies() -> Observable<[MovieModel]> {
        return repository.getPopularMovies().map({
            MovieMapper.mapEntityToDomain(entity: $0)
        })

    }
    
}
