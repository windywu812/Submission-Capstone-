//
//  WatchlistPresenter.swift
//  Watchlist
//
//  Created by Windy on 22/11/20.
//

import RxSwift
import RxCocoa
import UIKit
import Core

public class WatchlistPresenter {
    
    private let disposeBag = DisposeBag()
    private let interactor: WatchlistUseCase
    private let router: GenericRouter
    public var view: UIViewController?
    
    public var listMovies = BehaviorSubject<[WatchlistModel]>(value: [])
    
    public init(interactor: WatchlistUseCase, router: GenericRouter) {
        self.interactor = interactor
        self.router = router
        getWatchlist()
    }
    
    public func getWatchlist() {
        interactor.getWatchlist()
            .observeOn(MainScheduler.instance)
            .bind(to: listMovies)
            .disposed(by: disposeBag)
    }
    
    public func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
