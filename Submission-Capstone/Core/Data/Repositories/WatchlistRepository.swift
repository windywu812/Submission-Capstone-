//
//  CoreDataRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation
import RxSwift

protocol WatchlistRepositoryProtocol {
    func getWatchlist() -> Observable<[WatchlistEntity]>
}

class WatchlistRepository {
    
    typealias CoreDataInstance = (WatchlistDataSource) -> WatchlistRepository
    let remote: WatchlistDataSource
    
    private init(remote: WatchlistDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: CoreDataInstance = { remote in
        return WatchlistRepository(remote: remote)
    }
    
}

extension WatchlistRepository: WatchlistRepositoryProtocol {
    
    func getWatchlist() -> Observable<[WatchlistEntity]> {
        return remote.getWatchlist()
            .map({ MovieMapper.mapResponseToWatchlistEntity(input: $0) })
    }
    
}
