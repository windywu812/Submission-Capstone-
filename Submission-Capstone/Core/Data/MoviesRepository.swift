//
//  MoviesRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation
import RxSwift

protocol MoviesRepositoryProtocol {
    func getNowPlayingMovies() -> Observable<[MovieModel]>
    func getTopRatedMovies() -> Observable<[MovieModel]>
    func getUpcomingMovies() -> Observable<[MovieModel]>
    func getPopularMovies() -> Observable<[MovieModel]>
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
    
    func getNowPlayingMovies() -> Observable<[MovieModel]> {
        return remote.getNowPlayingMovies()
            .map({ MovieMapper.mapResponseToMovieModel(input: $0) })
    }
    
    func getTopRatedMovies() -> Observable<[MovieModel]> {
        return remote.getTopRatedMovies()
            .map({ MovieMapper.mapResponseToMovieModel(input: $0) })
    }
    
    func getUpcomingMovies() -> Observable<[MovieModel]> {
        return remote.getUpcomingMovies()
            .map({ MovieMapper.mapResponseToMovieModel(input: $0) })
    }
    
    func getPopularMovies() -> Observable<[MovieModel]> {
        return remote.getPopularMovies()
            .map({ MovieMapper.mapResponseToMovieModel(input: $0) })
    }
    
}
