//
//  MainRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit

class HomeRouter {
    
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection().provideDetailUseCase(idMovie: idMovie)
        
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }
    
    func goToSeeAllView(movies: [MovieModel]) -> UIViewController {
        
        let seeAllInteractor = SeeAllInteractor(movies: movies)
        
        let presenter = SeeAllPresenter(interactor: seeAllInteractor)
        
        let seeAllView: GridCollectionNode = GridCollectionNode(presenter: presenter)
        
        return seeAllView
        
    }
    
}
