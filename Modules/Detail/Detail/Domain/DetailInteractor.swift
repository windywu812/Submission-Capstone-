//
//  DetailInteractor.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import Foundation
import RxSwift

public protocol DetailUseCase {
    func getMovie(idMovie: Int) -> Observable<DetailModel>
    func addToWatchlist(movie: DetailModel)
    func checkIfAdded(idMovie: Int) -> Bool
}

public class DetailInteractor: DetailUseCase {
    
    private let repository: DetailMovieRepositoryProtocol
    
    init(repository: DetailMovieRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getMovie(idMovie: Int) -> Observable<DetailModel> {
        return repository.getDetail(idMovie: idMovie).map({
            DetailMapper.mapEntityToDomain(entity: $0)
        })
    }
    
    public func addToWatchlist(movie: DetailModel) {
        repository.addToWatchlist(watchlist: DetailMapper.mapDomainToEntity(model: movie))
    }
    
    public func checkIfAdded(idMovie: Int) -> Bool {
        return repository.checkIfFavorited(idMovie: idMovie)
    }
    
}
