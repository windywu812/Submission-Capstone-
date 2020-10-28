//
//  RemoteDataSource.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import RxSwift
import Alamofire
import Foundation

protocol RemoteDataSourceProtocol: class {
    func getNowPlayingMovies() -> Observable<[MovieResponse]>
    func getTopRatedMovies() -> Observable<[MovieResponse]>
    func getUpcomingMovies() -> Observable<[MovieResponse]>
    func getPopularMovies() -> Observable<[MovieResponse]>
}

class RemoteDataSource: NSObject {
    static let shared: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getNowPlayingMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.nowPlaying.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                        case .failure(let error):
                            print(error)
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getTopRatedMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.topRated.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                        case .failure(let error):
                            print(error)
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getUpcomingMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.upComing.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                        case .failure(let error):
                            print(error)
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getPopularMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.popular.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { (response) in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                        case .failure(let error):
                            print(error)
                            observer.onError(error)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
