//
//  MainRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit
import Movie
import Detail
import SeeAll
import Core

class MovieRouter: GenericRouter {
   
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection.provideDetailUseCase()
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }
    
    func goToSeeAllView<T>(movies: [T]) -> UIViewController? {
        let seeAllInteractor = SeeAllInteractor(movies: movies as! [SeeAllModel])
        let router = SeeAllRouter()
        let presenter = SeeAllPresenter(interactor: seeAllInteractor, router: router)
        let seeAllView: GridCollectionNode = GridCollectionNode(presenter: presenter)
        
        presenter.view = seeAllView
        
        return seeAllView
    }
    
}
