//
//  DetailInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    func getMovie(idMovie: Int) -> Observable<DetailModel>
    func addToWatchlist(movie: DetailModel)
    func checkIfAdded(idMovie: Int) -> Bool
}

class DetailInteractor: DetailUseCase {
    
    private let repository: DetailMovieRepositoryProtocol
    
    init(repository: DetailMovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovie(idMovie: Int) -> Observable<DetailModel> {
        return repository.getDetail(idMovie: idMovie).map({
            MovieMapper.mapEntityToDetailModel(input: $0)
        })
    }
    
    func addToWatchlist(movie: DetailModel) {
        repository.addToWatchlist(watchlist: MovieMapper.mapModelToWatchlistEnity(input: movie))
    }
    
    func checkIfAdded(idMovie: Int) -> Bool {
        return repository.checkIfFavorited(idMovie: idMovie)
    }
    
}
