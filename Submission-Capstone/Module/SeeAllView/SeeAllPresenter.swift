//
//  SeeAllPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import AsyncDisplayKit

class SeeAllPresenter {
    
    private let interactor: SeeAllUseCase
    private let router: SeeAllRouter
    
    var view: UIViewController?
    
    var movies: [MovieModel] = []
    
    init(interactor: SeeAllUseCase, router: SeeAllRouter) {
        self.interactor = interactor
        self.router = router
        
        getMovie()
    }
    
    private func getMovie() {
        movies = interactor.getAllMovies()
    }
    
    func goToDetail(idMovie: Int) {
        let detailView = router.goToDetailView(idMovie: idMovie)
        view?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
