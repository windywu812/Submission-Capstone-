//
//  FavoritePresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import RxSwift
import RxCocoa
import AsyncDisplayKit

class WatchlistPresenter {
    
    private let disposeBag = DisposeBag()
    private let interactor: WatchlistUseCase
    private let router = SearchRouter()
    var view: UIViewController?
    
    var listMovies = BehaviorSubject<[WatchlistModel]>(value: [])
    
    init(interactor: WatchlistUseCase) {
        self.interactor = interactor
        
        getWatchlist()
    }
    
    func getWatchlist() {
        interactor.getWatchlist()
            .observeOn(MainScheduler.instance)
            .bind(to: listMovies)
            .disposed(by: disposeBag)
    }
    
    func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
