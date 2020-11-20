//
//  MainRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit

protocol Router {
    
}

class HomeRouter: Router {
    
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection.provideDetailUseCase()
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }
    
    func goToSeeAllView(movies: [MovieModel]) -> UIViewController {
        
        let seeAllInteractor = SeeAllInteractor(movies: movies)
        let router = SeeAllRouter()
        let presenter = SeeAllPresenter(interactor: seeAllInteractor, router: router)
        let seeAllView: GridCollectionNode = GridCollectionNode(presenter: presenter)
        
        presenter.view = seeAllView
        
        return seeAllView
    }
    
}
