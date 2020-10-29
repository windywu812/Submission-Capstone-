//
//  DetailDataSource.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import RxSwift
import Foundation
import Alamofire

protocol DetailDataSourceProtocol: class {
    func getDetailMovie(idMovie: Int) -> Observable<DetailResponse>
}

class DetailDataSource: NSObject {
    static let shared = DetailDataSource()
}

extension DetailDataSource: DetailDataSourceProtocol {
    
    func getDetailMovie(idMovie: Int) -> Observable<DetailResponse> {
        return Observable<DetailResponse>.create { observer in
            if let url = URL(string: "\(Endpoints.Gets.detail(idMovie))") {
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
    
}
