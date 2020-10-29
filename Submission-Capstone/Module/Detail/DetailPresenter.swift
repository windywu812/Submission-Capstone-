//
//  DetailPresenter.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import Foundation
import RxSwift
import RxCocoa

class DetailPresenter {
    
    private let interactor: DetailUseCase
    
    var detail = PublishSubject<DetailModel>()
    
    init(interactor: DetailUseCase, idMovie: Int) {
        self.interactor = interactor
        
        getMovie(idMovie: idMovie)
    }
    
    func getMovie(idMovie: Int) {
        interactor.getMovie(idMovie: idMovie)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (detail) in
                print(detail)
            }, onError: { (error) in
                print(error.localizedDescription)
            })
            .disposed(by: DisposeBag())
    }
    
}
