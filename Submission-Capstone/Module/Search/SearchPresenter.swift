//
//  SearchPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import AsyncDisplayKit
import RxSwift
import RxCocoa
import Search

class SearchPresenter {
    
    private let disposeBag = DisposeBag()
    private let interactor: SearchUseCase
    private let router = SearchRouter()
    
    var listMovies = BehaviorSubject<[MovieModel]>(value: [])
    var view: UIViewController?
    
    init(interactor: SearchUseCase) {
        self.interactor = interactor
    }
    
    func getMovies(keyword: String) {
        interactor.getListMovies(keyword: keyword)
            .observeOn(MainScheduler.instance)
//            .bind(to: listMovies)
//            .disposed(by: disposeBag)
    }
    
    func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
