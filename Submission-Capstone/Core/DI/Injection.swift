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
    
    func provideHomeUseCase() -> HomeUseCase {
        
        let homeUseCase: HomeUseCase = HomeUseCase.init(repository: provideRepository())

        return homeUseCase
    }
    
}
