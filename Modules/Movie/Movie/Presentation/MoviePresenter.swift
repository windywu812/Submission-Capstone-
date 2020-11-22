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
import SeeAll

public class MoviePresenter {
    
    private let interactor: MovieUseCase
    private let router: GenericRouter
    private let disposeBag = DisposeBag()
    
    public var view: UIViewController?
    public var nowPlayingMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var topRatedMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var popularMovies = BehaviorSubject<[MovieModel]>(value: [])
    public var upcomingMovies = BehaviorSubject<[MovieModel]>(value: [])
    
    public init(interactor: MovieUseCase, router: GenericRouter) {
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
        guard let seeAllView = router.goToSeeAllView(movies: interactor.mapMovieToSeeAll(movies: movies)) else { return }
        view?.navigationController?.pushViewController(seeAllView, animated: true)
    }
    
}
