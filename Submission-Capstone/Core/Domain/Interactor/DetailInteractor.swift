//
//  DetailInteractor.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    func getMovie(idMovie: Int) -> Observable<DetailModel>
    func addToWatchlist(movie: DetailModel)
    func checkIfAdded(idMovies: Int) -> Bool
}

class DetailInteractor: DetailUseCase {
    
    private let coreDataService: CoreDataService
    private let repository: DetailMovieRepositoryProtocol
    private let hapticService: HapticService
    
    init(repository: DetailMovieRepositoryProtocol, coreDataService: CoreDataService, hapticService: HapticService) {
        self.repository = repository
        self.coreDataService = coreDataService
        self.hapticService = hapticService
    }
    
    func getMovie(idMovie: Int) -> Observable<DetailModel> {
        return repository.getDetail(idMovie: idMovie)
    }
    
    func addToWatchlist(movie: DetailModel) {
        coreDataService.addMovie(detail: movie)
        hapticService.simpleHaptic()
    }
    
    func checkIfAdded(idMovies: Int) -> Bool {
        return coreDataService.checkIfFavorited(idMovie: idMovies)
    }
    
}
