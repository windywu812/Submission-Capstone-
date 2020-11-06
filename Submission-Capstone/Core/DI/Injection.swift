//
//  Injection.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import Foundation

class Injection {
        
    static func provideHomeUseCase() -> HomeInteractor {
        let remote = RemoteDataSource.shared
        let repository = MoviesRepository.sharedInstance(remote)
        let homeUseCase = HomeInteractor(repository: repository)
        
        return homeUseCase
    }
    
    static func provideDetailUseCase() -> DetailUseCase {
        let remote = DetailDataSource.shared
        let repository = DetailMovieRepository.sharedInstance(remote)
        let detailUseCase = DetailInteractor(repository: repository)
        
        return detailUseCase
    }
    
    static func provideSearchUseCase() -> SearchUseCase {
        let remote = SearchDataSource.shared
        let repository = SearchMoviesRepository.sharedInstance(remote)
        let searchUseCase = SearchInteractor(repository: repository)
        
        return searchUseCase
    }
    
    static func provideWatchlistUseCase() -> WatchlistUseCase {
        let remote = WatchlistDataSource.shared
        let repository = WatchlistRepository.sharedInstance(remote)
        let watchlistUseCase = WatchlistInteractor(
            repository: repository)
        
        return watchlistUseCase
    }
    
    static func provideProfileUseCase() -> ProfileUseCase {
        let remote = ProfileDataSource.shared
        let repository = ProfileRepository.sharedInstance(remote)
        let profileUseCase = ProfileInteractor(repository: repository)
        
        return profileUseCase
    }
    
}
