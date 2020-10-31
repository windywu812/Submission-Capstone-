//
//  DetailPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation
import RxSwift
import RxCocoa

class DetailPresenter {
    
    private let interactor: DetailUseCase
    private let disposeBag = DisposeBag()
    
    var detailMovie = BehaviorSubject<DetailModel?>(value: nil)
    
    init(interactor: DetailUseCase, idMovie: Int) {
        self.interactor = interactor
           
        getMovie(idMovie: idMovie)
        
        
    }
    
    func getMovie(idMovie: Int) {
        interactor.getMovie(idMovie: idMovie)
            .observeOn(MainScheduler.instance)
            .bind(to: detailMovie)
            .disposed(by: disposeBag)
    }
    
    func addToWatchlist() {
        guard let movie = try? detailMovie.value() else { return }
        interactor.addToWatchlist(movie: movie)
    }
    
    func checkIfAdded() -> Bool {
        
        if let idMovie = try? detailMovie.value()?.idMovie {
            print(idMovie)
        }
        
        if let idMovie = try? detailMovie.value()?.idMovie {
            return self.interactor.checkIfAdded(idMovies: idMovie)
        }
        
        return false
    }
    
}
