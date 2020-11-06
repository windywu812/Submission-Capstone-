//
//  MoviesRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation
import RxSwift

protocol MoviesRepositoryProtocol {
    func getNowPlayingMovies() -> Observable<[MovieEntity]>
    func getTopRatedMovies() -> Observable<[MovieEntity]>
    func getUpcomingMovies() -> Observable<[MovieEntity]>
    func getPopularMovies() -> Observable<[MovieEntity]>
}

class MoviesRepository {
    
    typealias MoviesInstance = (RemoteDataSource) -> MoviesRepository
    let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MoviesInstance = { remote in
        return MoviesRepository(remote: remote)
    }
    
}

extension MoviesRepository: MoviesRepositoryProtocol {
    
    func getNowPlayingMovies() -> Observable<[MovieEntity]> {
        return remote.getNowPlayingMovies()
            .map({ MovieMapper.mapResponseToMovieEntity(input: $0) })
    }
    
    func getTopRatedMovies() -> Observable<[MovieEntity]> {
        return remote.getTopRatedMovies()
            .map({ MovieMapper.mapResponseToMovieEntity(input: $0) })
    }
    
    func getUpcomingMovies() -> Observable<[MovieEntity]> {
        return remote.getUpcomingMovies()
            .map({ MovieMapper.mapResponseToMovieEntity(input: $0) })
    }
    
    func getPopularMovies() -> Observable<[MovieEntity]> {
        return remote.getPopularMovies()
            .map({ MovieMapper.mapResponseToMovieEntity(input: $0) })
    }
    
}
