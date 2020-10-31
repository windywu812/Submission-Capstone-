//
//  WatchlistInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import Foundation
import RxSwift

protocol WatchlistUseCase {
    func getWatchlist() -> Observable<[Movie]>
    func deleteMovie(idMovie: Int)
}

class WatchlistInteractor: WatchlistUseCase {
    
    private let repository: WatchlistRepositoryProtocol
    private let coreDataService: CoreDataService
    
    init(repository: WatchlistRepositoryProtocol, coreDataService: CoreDataService) {
        self.repository = repository
        self.coreDataService = coreDataService
    }
    
    func getWatchlist() -> Observable<[Movie]> {
        return repository.getWatchlist()
    }
    
    func deleteMovie(idMovie: Int) {
        coreDataService.deleteMovie(idMovie: idMovie)
    }
    
}
