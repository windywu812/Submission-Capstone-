//
//  HomePresenter.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import UIKit
import RxSwift
import RxCocoa
import Core

public class MoviePresenter {
    
    private let interactor: MovieUseCase
    private let router: MovieRouterProtocol
    private let disposeBag = DisposeBag()
    
    public var view: UIViewController?
    public var nowPlayingMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var topRatedMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var popularMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var upcomingMovies = BehaviorSubject<[MovieModel]>(value: [])
    
    public init(interactor: MovieUseCase, router: MovieRouterProtocol) {
        self.interactor = interactor
        self.router = router
        getMovies()
    }
    
    private func getMovies() {
        interactor.getNowPlayingMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: nowPlayingMovies)
            .disposed(by: disposeBag)
        
        interactor.getTopRatedMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: topRatedMovies)
            .disposed(by: disposeBag)
        
        interactor.getPopularMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: popularMovies)
            .disposed(by: disposeBag)
        
        interactor.getUpcomingMovies()
            .observeOn(MainScheduler.instance)
            .bind(to: upcomingMovies)
            .disposed(by: disposeBag)
    }
    
    public func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
    public func goToSeeAll(movies: [MovieModel]) {
        let seeAllView = router.goToSeeAllView(movies: movies)
        view?.navigationController?.pushViewController(seeAllView, animated: true)
    }
    
}
