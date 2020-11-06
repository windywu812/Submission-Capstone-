//
//  WatchlistInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation
import RxSwift

protocol WatchlistUseCase {
    func getWatchlist() -> Observable<[WatchlistModel]>
}

class WatchlistInteractor: WatchlistUseCase {
    
    private let repository: WatchlistRepositoryProtocol
    
    init(repository: WatchlistRepositoryProtocol) {
        self.repository = repository
    }
    
    func getWatchlist() -> Observable<[WatchlistModel]> {
        return repository.getWatchlist().map({
            MovieMapper.mapResponseToWatchlistModel(input: $0)
        })
    }
    
}
