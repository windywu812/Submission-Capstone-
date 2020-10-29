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
    
}
