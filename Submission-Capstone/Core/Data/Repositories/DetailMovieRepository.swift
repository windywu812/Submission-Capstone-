//
//  DetailMovieRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import RxSwift

protocol DetailMovieRepositoryProtocol {
    func getDetail(idMovie: Int) -> Observable<DetailEntity>
    func checkIfFavorited(idMovie: Int) -> Bool
    func addToWatchlist(watchlist: DetailEntity)
}

class DetailMovieRepository {
    
    typealias DetailMovieInstance = (DetailDataSource) -> DetailMovieRepository
    let remote: DetailDataSourceProtocol
    
    private init(remote: DetailDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: DetailMovieInstance = { remote in
        return DetailMovieRepository(remote: remote)
    }
    
}

extension DetailMovieRepository: DetailMovieRepositoryProtocol {
    
    func getDetail(idMovie: Int) -> Observable<DetailEntity> {
        return remote.getDetailMovie(idMovie: idMovie)
            .map({ MovieMapper.mapResponseToDetailEntity(input: $0) })
    }
    
    func checkIfFavorited(idMovie: Int) -> Bool {
        return remote.checkIfFavorited(idMovie: idMovie)
    }
    
    func addToWatchlist(watchlist: DetailEntity) {
        remote.addToWatchlist(
            movie: MovieMapper.mapEntityToDetailResponse(input: watchlist))
    }
    
}
