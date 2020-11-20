//
//  DetailDataSource.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import RxSwift
import Foundation
import Alamofire
import Common

public protocol DetailDataSourceProtocol: class {
    func getDetailMovie(idMovie: Int) -> Observable<DetailResponse>
    func checkIfFavorited(idMovie: Int) -> Bool
    func addToWatchlist(movie: DetailResponse)
}

public class DetailDataSource: NSObject {
    static let shared = DetailDataSource()
}

extension DetailDataSource: DetailDataSourceProtocol {
   
    public func getDetailMovie(idMovie: Int) -> Observable<DetailResponse> {
        return Observable<DetailResponse>.create { observer in
            if let url = URL(string: "\(Endpoints.detail("\(idMovie)").url)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: DetailResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    public func checkIfFavorited(idMovie: Int) -> Bool {
//        CoreDataService.shared.checkIfFavorited(idMovie: idMovie)
        return false
    }
    
    public func addToWatchlist(movie: DetailResponse) {
//        CoreDataService.shared.addMovie(detail: movie)
//        HapticService.shared.simpleHaptic()
    }
    
}

