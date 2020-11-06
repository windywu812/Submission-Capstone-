//
//  LocaleDataSource.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import RxSwift
import CoreData

protocol WatchlistDataSourceProtocol {
    func getWatchlist() -> Observable<[Watchlist]>
    func delete(idMovie: Int)
    func checkIfAdded(idMovie: Int) -> Bool
}

class WatchlistDataSource: NSObject {
    static let shared = WatchlistDataSource()
}

extension WatchlistDataSource: WatchlistDataSourceProtocol {
    
    func delete(idMovie: Int) {
        CoreDataService.shared.deleteMovie(idMovie: idMovie)
    }
    
    func getWatchlist() -> Observable<[Watchlist]> {
        return CoreDataService.shared.fetchFromCoreData()
    }
    
    func checkIfAdded(idMovie: Int) -> Bool {
        return CoreDataService.shared.checkIfFavorited(idMovie: idMovie)
    }
    
}
