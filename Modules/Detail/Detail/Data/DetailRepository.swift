//
//  DetailRepository.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import RxSwift

public protocol DetailMovieRepositoryProtocol {
    func getDetail(idMovie: Int) -> Observable<DetailEntity>
    func checkIfFavorited(idMovie: Int) -> Bool
    func addToWatchlist(watchlist: DetailEntity)
}

public class DetailMovieRepository {
    
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
    
    public func getDetail(idMovie: Int) -> Observable<DetailEntity> {
        return remote.getDetailMovie(idMovie: idMovie)
            .map({ DetailMapper.mapResponseToEntity(response: $0) })
    }
    
    public func checkIfFavorited(idMovie: Int) -> Bool {
        return remote.checkIfFavorited(idMovie: idMovie)
    }
    
    public func addToWatchlist(watchlist: DetailEntity) {
        remote.addToWatchlist(
            movie: DetailMapper.mapEntityToResponse(model: watchlist))
    }
    
}

