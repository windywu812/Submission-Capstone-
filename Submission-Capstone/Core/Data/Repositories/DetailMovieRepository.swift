//
//  DetailMovieRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import RxSwift

protocol DetailMovieRepositoryProtocol {
    func getDetail(idMovie: Int) -> Observable<DetailModel>
    func checkIfFavorited(idMovie: Int) -> Bool
    func addToWatchlist(watchlist: DetailModel)
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
    
    func getDetail(idMovie: Int) -> Observable<DetailModel> {
        return remote.getDetailMovie(idMovie: idMovie)
            .map({ MovieMapper.mapResponseDetailToDetailModel(input: $0) })
    }
    
    func checkIfFavorited(idMovie: Int) -> Bool {
        return remote.checkIfFavorited(idMovie: idMovie)
    }
    
    func addToWatchlist(watchlist: DetailModel) {
        remote.addToWatchlist(movie: MovieMapper.mapWatchlistModelToResponse(input: watchlist))
    }
    
}
