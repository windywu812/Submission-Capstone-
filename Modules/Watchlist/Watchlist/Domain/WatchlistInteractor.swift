//
//  WatchlistInteractor.swift
//  Watchlist
//
//  Created by Windy on 22/11/20.
//

import Foundation
import RxSwift

public protocol WatchlistUseCase {
    func getWatchlist() -> Observable<[WatchlistModel]>
}

public class WatchlistInteractor: WatchlistUseCase {
    
    private let repository: WatchlistRepositoryProtocol
    
    public init(repository: WatchlistRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getWatchlist() -> Observable<[WatchlistModel]> {
        return repository.getWatchlist().map({
            WatchlistMapper.mapEntityToDomain(entity: $0)
        })
    }
    
}

