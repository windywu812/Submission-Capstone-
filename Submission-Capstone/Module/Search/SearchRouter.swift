//
//  SearchRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import UIKit

class SearchRouter {
    
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection().provideDetailUseCase()
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }
    
}
