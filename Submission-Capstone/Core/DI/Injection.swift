//
//  Injection.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import Foundation

class Injection {
        
    func provideHomeUseCase() -> HomeInteractor {
        
        let remote = RemoteDataSource.shared
        let repository = MoviesRepository.sharedInstance(remote)
        
        let homeUseCase = HomeInteractor(repository: repository)
        return homeUseCase
    }
    
    func provideDetailUseCase() -> DetailUseCase {
        
        let remote = DetailDataSource.shared
        let repository = DetailMovieRepository.sharedInstance(remote)
        
        let detailUseCase = DetailInteractor(
            repository: repository,
            coreDataService: CoreDataService(),
            hapticService: HapticService())
        
        return detailUseCase
    }
    
    func provideSearchUseCase() -> SearchUseCase {
        
        let remote = SearchDataSource.shared
        let repository = SearchMoviesRepository.sharedInstance(remote)
        
        let searchUseCase = SearchInteractor(repository: repository)
        return searchUseCase
    }
    
    func provideWatchlistUseCase() -> WatchlistUseCase {
        
        let remote = WatchlistDataSource.shared
        let repository = WatchlistRepository.sharedInstance(remote)
        
        let watchlistUseCase = WatchlistInteractor(repository: repository, coreDataService: CoreDataService())
        return watchlistUseCase
    }
    
    func provideProfileUseCase() -> ProfileUseCase {
        
        let remote = ProfileDataSource.shared
        let repository = ProfileRepository.sharedInstance(remote)
        
        let profileUseCase = ProfileInteractor(repository: repository)
        
        return profileUseCase
    }
    
}
