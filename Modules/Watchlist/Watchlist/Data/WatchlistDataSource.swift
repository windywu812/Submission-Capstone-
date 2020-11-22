//
//  WatchlistDataSource.swift
//  Watchlist
//
//  Created by Windy on 22/11/20.
//

import Foundation
import CoreData
import RxSwift
import Common

public protocol WatchlistDataSourceProtocol {
    func getWatchlist() -> Observable<[Watchlist]>
    func delete(idMovie: Int)
    func checkIfAdded(idMovie: Int) -> Bool
}

public class WatchlistDataSource: NSObject {
    public static let shared = WatchlistDataSource()
}

extension WatchlistDataSource: WatchlistDataSourceProtocol {
    
    public func delete(idMovie: Int) {
        CoreDataService.shared.deleteMovie(idMovie: idMovie)
    }
    
    public func getWatchlist() -> Observable<[Watchlist]> {
        return CoreDataService.shared.fetchFromCoreData()
    }
    
    public func checkIfAdded(idMovie: Int) -> Bool {
        return CoreDataService.shared.checkIfFavorited(idMovie: idMovie)
    }
    
}
