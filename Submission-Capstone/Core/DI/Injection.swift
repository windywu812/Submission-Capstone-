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
    
    func provideHomeUseCase() -> HomeInteractor {
        
        let homeUseCase: HomeInteractor = HomeInteractor(repository: provideRepository())

        return homeUseCase
    }
    
    func provideDetailUseCase(idMovie: Int) -> DetailUseCase {
        
        let detailUseCase: DetailUseCase = DetailInteractor(repository: provideDetailRepository())
                
        return detailUseCase
        
    }
    
}
