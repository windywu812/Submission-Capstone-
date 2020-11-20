//
//  DetailPresenter.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import Foundation
import RxSwift
import RxCocoa

public class DetailPresenter {
    
    private let interactor: DetailUseCase
    private let idMovie: Int
    private let disposeBag = DisposeBag()
    
    public var detailMovie = BehaviorSubject<DetailModel?>(value: nil)
    
    public init(interactor: DetailUseCase, idMovie: Int) {
        self.interactor = interactor
        self.idMovie = idMovie
        
        getMovie(idMovie: idMovie)
    }
    
    private func getMovie(idMovie: Int) {
        interactor.getMovie(idMovie: idMovie)
            .observeOn(MainScheduler.instance)
            .bind(to: detailMovie)
            .disposed(by: disposeBag)
    }
    
    public func addToWatchlist() {
        guard let movie = try? detailMovie.value() else { return }
        interactor.addToWatchlist(movie: movie)
    }
    
    public func checkIfAdded() -> Bool {
        return interactor.checkIfAdded(idMovie: idMovie)
    }
    
}
