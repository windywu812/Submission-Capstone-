//
//  RemoteDataSource.swift
//  Movie
//
//  Created by Windy on 20/11/20.
//

import RxSwift
import Alamofire
import Foundation
import Common

public protocol RemoteDataSourceProtocol: class {
    func getNowPlayingMovies() -> Observable<[MovieResponse]>
    func getTopRatedMovies() -> Observable<[MovieResponse]>
    func getUpcomingMovies() -> Observable<[MovieResponse]>
    func getPopularMovies() -> Observable<[MovieResponse]>
}

public class MoviesDataSource: NSObject {
    public static let shared: MoviesDataSource = MoviesDataSource()
    public override init() {}
}

extension MoviesDataSource: RemoteDataSourceProtocol {
    
    public func getNowPlayingMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.nowPlaying.url) {
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
    
    public func getTopRatedMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.topRated.url) {
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
    
    public func getUpcomingMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.upComing.url) {
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
    
    public func getPopularMovies() -> Observable<[MovieResponse]> {
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.popular.url) {
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
