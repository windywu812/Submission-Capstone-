//
//  Injection.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit
import Movie
import Detail

class Injection {
    
    static func provideMovieUseCase() -> MovieUseCase {
        let remote = MoviesDataSource.shared
        let repository = MoviesRepository.sharedInstance(remote)
        let movieUseCase = MovieInteractor(repository: repository)
        
        return movieUseCase
    }
     
    static func provideDetailUseCase() -> DetailUseCase {
        /// App delegate can't be nil, if it's nil the app won't launch 🙏🏻
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let watchlist = Watchlist(context: moc)
        let remote = DetailDataSource(moc: moc, watchlist: watchlist)
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
