//
//  Injection.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import Foundation

class Injection {
    
    private func provideRepository() -> MoviesRepository {
        let remote: RemoteDataSource = RemoteDataSource.shared
        return MoviesRepository.sharedInstance(remote)
    }
    
    private func provideDetailRepository() -> DetailMovieRepository {
        let remote: DetailDataSource = DetailDataSource.shared
        return DetailMovieRepository.sharedInstance(remote)
    }
    
    private func provideSearchRepository() -> SearchMoviesRepository {
        let remote: SearchDataSource = SearchDataSource.shared
        return SearchMoviesRepository.shared(remote)
    }
    
    private func provideWatchlistRepository() -> WatchlistRepository {
        let remote: WatchlistDataSource = WatchlistDataSource.shared
        return WatchlistRepository.sharedInstance(remote)
    }
    
    func provideHomeUseCase() -> HomeInteractor {
        let homeUseCase: HomeInteractor = HomeInteractor(repository: provideRepository())
        return homeUseCase
    }
    
    func provideDetailUseCase() -> DetailUseCase {
        let detailUseCase: DetailUseCase = DetailInteractor(repository: provideDetailRepository(), coreDataService: CoreDataService(), hapticService: HapticService())
        return detailUseCase
    }
    
    func provideSearchUseCase(keyword: String) -> SearchUseCase {
        let searchUseCase: SearchUseCase = SearchInteractor(repository: provideSearchRepository())
        return searchUseCase
    }
    
    func provideWatchlistUseCase() -> WatchlistUseCase {
        let watchlistUseCase: WatchlistUseCase = WatchlistInteractor(repository: provideWatchlistRepository())
        return watchlistUseCase
    }
    
}
