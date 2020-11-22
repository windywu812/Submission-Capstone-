//
//  SeeAllPresenter.swift
//  SeeAll
//
//  Created by Windy on 22/11/20.
//

import UIKit
import Core

public class SeeAllPresenter {
    
    private let interactor: SeeAllUseCase
    private let router: GenericRouter
    
    public var view: UIViewController?
    
    public var movies: [SeeAllModel] = []
    
    public init(interactor: SeeAllUseCase, router: GenericRouter) {
        self.interactor = interactor
        self.router = router
        
        getMovie()
    }
    
    private func getMovie() {
        movies = interactor.getAllMovies()
    }
    
    public func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
