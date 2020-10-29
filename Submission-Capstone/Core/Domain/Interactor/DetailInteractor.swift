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
    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: DetailMovieRepositoryProtocol
    
    init(repository: DetailMovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovie(idMovie: Int) -> Observable<DetailModel> {
        return repository.getDetail(idMovie: idMovie)
    }
    
}
