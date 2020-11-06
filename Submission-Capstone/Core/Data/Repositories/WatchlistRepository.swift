//
//  CoreDataRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation
import RxSwift

protocol WatchlistRepositoryProtocol {
    func getWatchlist() -> Observable<[WatchlistModel]>
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
    
    func getWatchlist() -> Observable<[WatchlistModel]> {
        return remote.getWatchlist()
            .map({ MovieMapper.mapResponseToWatchlistModel(input: $0) })
    }
    
}
