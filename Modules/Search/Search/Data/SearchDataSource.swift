//
//  SearchDataSource.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import Foundation
import RxSwift
import Common
import Alamofire

public protocol SearchDataSourceProtocol: class {
    func getListMovies(keyword: String) -> Observable<[SearchResponse]>
}

public class SearchDataSource: NSObject {
    public static let shared = SearchDataSource()
}

extension SearchDataSource: SearchDataSourceProtocol {
    
    public func getListMovies(keyword: String) -> Observable<[SearchResponse]> {
        return Observable<[SearchResponse]>.create { observer in
            if let url = URL(string: "\(Endpoints.search(keyword).url)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: SearchMoviesResponse.self) { (response) in
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
