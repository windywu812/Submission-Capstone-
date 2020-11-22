//
//  SearchRepository.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import RxSwift

public protocol SearchMoviesRepositoryProtocol {
    func getListMovies(keyword: String) -> Observable<[SearchEntity]>
}

public class SearchRepository {
    
    public typealias SearchMoviesInstance = (SearchDataSource) -> SearchRepository
    public let remote: SearchDataSourceProtocol
    
    private init(remote: SearchDataSource) {
        self.remote = remote
    }
    
    public static let sharedInstance: SearchMoviesInstance = { remote in
        return SearchRepository(remote: remote)
    }
    
}

extension SearchRepository: SearchMoviesRepositoryProtocol {
    
    public func getListMovies(keyword: String) -> Observable<[SearchEntity]> {
        return remote.getListMovies(keyword: keyword)
            .map({ SearchMapper.mapResponseToEntity(response: $0) })
    }
    
}
