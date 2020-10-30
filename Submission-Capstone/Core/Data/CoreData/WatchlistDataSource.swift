//
//  LocaleDataSource.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import RxSwift
import CoreData

protocol WatchlistDataSourceProtocol {
    func getWatchlist() -> Observable<[Movie]>
}

class WatchlistDataSource: NSObject {
    static let shared = WatchlistDataSource()
}

extension WatchlistDataSource: WatchlistDataSourceProtocol {
    
    func getWatchlist() -> Observable<[Movie]> {
        return CoreDataService.shared.fetchFromCoreData()
    }
    
}
