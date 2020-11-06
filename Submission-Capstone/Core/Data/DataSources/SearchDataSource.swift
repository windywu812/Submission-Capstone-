//
//  SearchDataSource.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import RxSwift
import Alamofire
import Foundation

protocol SearchDataSourceProtocol: class {
    func getListMovies(keyword: String) -> Observable<[MovieResponse]>
}

class SearchDataSource: NSObject {
    static let shared = SearchDataSource()
}

extension SearchDataSource: SearchDataSourceProtocol {
    
    func getListMovies(keyword: String) -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: "\(Endpoints.search(keyword).url)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
