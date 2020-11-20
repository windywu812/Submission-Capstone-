//
//  SeeAllRouter.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import UIKit
import Detail

class SeeAllRouter {
    
    func goToDetailView(idMovie: Int) -> UIViewController {
        let detailIntercator = Injection.provideDetailUseCase()
        
        let presenter = DetailPresenter(interactor: detailIntercator, idMovie: idMovie)
        
        let detailView = DetailViewController(presenter: presenter)
        
        return detailView
    }

}
