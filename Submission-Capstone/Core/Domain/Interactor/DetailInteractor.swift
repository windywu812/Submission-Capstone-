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
}

class DetailInteractor: DetailUseCase {
    
    private let coreDataService: CoreDataService
    private let repository: DetailMovieRepositoryProtocol
    
    init(repository: DetailMovieRepositoryProtocol, coreDataService: CoreDataService) {
        self.repository = repository
        self.coreDataService = coreDataService
    }
    
    func getMovie(idMovie: Int) -> Observable<DetailModel> {
        return repository.getDetail(idMovie: idMovie)
    }
    
    func addToWatchlist(movie: DetailModel) {
        coreDataService.addMovie(detail: movie)
    }
    
}
