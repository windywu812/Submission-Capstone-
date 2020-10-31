//
//  Injection.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import Foundation

class Injection {
        
    func provideHomeUseCase() -> HomeInteractor {
        
        let remote: RemoteDataSource = RemoteDataSource.shared
        let repository = MoviesRepository.sharedInstance(remote)
        
        let homeUseCase: HomeInteractor = HomeInteractor(repository: repository)
        return homeUseCase
    }
    
    func provideDetailUseCase() -> DetailUseCase {
        
        let remote: DetailDataSource = DetailDataSource.shared
        let repository = DetailMovieRepository.sharedInstance(remote)
        
        let detailUseCase: DetailUseCase = DetailInteractor(repository: repository, coreDataService: CoreDataService(), hapticService: HapticService())
        return detailUseCase
    }
    
    func provideSearchUseCase() -> SearchUseCase {
        
        let remote: SearchDataSource = SearchDataSource.shared
        let repository = SearchMoviesRepository.sharedInstance(remote)
        
        let searchUseCase: SearchUseCase = SearchInteractor(repository: repository)
        return searchUseCase
    }
    
    func provideWatchlistUseCase() -> WatchlistUseCase {
        
        let remote: WatchlistDataSource = WatchlistDataSource.shared
        let repository = WatchlistRepository.sharedInstance(remote)
        
        let watchlistUseCase: WatchlistUseCase = WatchlistInteractor(repository: repository, coreDataService: CoreDataService())
        return watchlistUseCase
    }
    
}
