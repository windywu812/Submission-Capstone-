//
//  MoviesRepository.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import RxSwift

public protocol MoviesRepositoryProtocol {
    func getNowPlayingMovies() -> Observable<[MovieEntity]>
    func getTopRatedMovies() -> Observable<[MovieEntity]>
    func getUpcomingMovies() -> Observable<[MovieEntity]>
    func getPopularMovies() -> Observable<[MovieEntity]>
}

public class MoviesRepository {
    
    public typealias MoviesInstance = (MoviesDataSource) -> MoviesRepository
    public let remote: MoviesDataSource
    
    public init(remote: MoviesDataSource) {
        self.remote = remote
    }
    
    public static let sharedInstance: MoviesInstance = { remote in
        return MoviesRepository(remote: remote)
    }
    
}

extension MoviesRepository: MoviesRepositoryProtocol {
    
    public func getNowPlayingMovies() -> Observable<[MovieEntity]> {
        return remote.getNowPlayingMovies()
            .map({ MovieMapper.mapResponseToEntity(response: $0) })
    }
    
    public func getTopRatedMovies() -> Observable<[MovieEntity]> {
        return remote.getTopRatedMovies()
            .map({ MovieMapper.mapResponseToEntity(response: $0) })
    }
    
    public func getUpcomingMovies() -> Observable<[MovieEntity]> {
        return remote.getUpcomingMovies()
            .map({ MovieMapper.mapResponseToEntity(response: $0) })
    }
    
    public func getPopularMovies() -> Observable<[MovieEntity]> {
        return remote.getPopularMovies()
            .map({ MovieMapper.mapResponseToEntity(response: $0) })
    }
    
}

