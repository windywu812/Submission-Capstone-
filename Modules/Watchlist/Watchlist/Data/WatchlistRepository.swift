//
//  WatchlistRepository.swift
//  Watchlist
//
//  Created by Windy on 22/11/20.
//

import Foundation
import RxSwift

public protocol WatchlistRepositoryProtocol {
    func getWatchlist() -> Observable<[WatchlistEntity]>
}

public class WatchlistRepository {
    
    public typealias CoreDataInstance = (WatchlistDataSource) -> WatchlistRepository
    public let remote: WatchlistDataSource
    
    private init(remote: WatchlistDataSource) {
        self.remote = remote
    }
    
    public static let sharedInstance: CoreDataInstance = { remote in
        return WatchlistRepository(remote: remote)
    }
    
}

extension WatchlistRepository: WatchlistRepositoryProtocol {
    
    public func getWatchlist() -> Observable<[WatchlistEntity]> {
        return remote.getWatchlist()
            .map({ WatchlistMapper.mapResponseToEntity(response: $0) })
    }
    
}
