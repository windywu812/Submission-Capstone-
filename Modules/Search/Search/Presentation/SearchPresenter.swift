//
//  SearchPresenter.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import UIKit
import RxSwift
import RxCocoa
import Core

public class SearchPresenter {
    
    private let disposeBag = DisposeBag()
    private let interactor: SearchUseCase
    private let router: GenericRouter
    
    public var listMovies = BehaviorSubject<[SearchModel]>(value: [])
    public var view: UIViewController?
    
    public init(interactor: SearchUseCase, router: GenericRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    public func getMovies(keyword: String) {
        interactor.getListMovies(keyword: keyword)
            .observeOn(MainScheduler.instance)
            .bind(to: listMovies)
            .disposed(by: disposeBag)
    }
    
    public func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
