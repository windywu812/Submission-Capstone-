//
//  SearchInteractor.swift
//  Search
//
//  Created by Windy on 22/11/20.
//

import Foundation
import RxSwift
import Movie

public protocol SearchUseCase {
    func getListMovies(keyword: String) -> Observable<[SearchModel]>
}

public class SearchInteractor: SearchUseCase {
    
    private let repository: SearchMoviesRepositoryProtocol
    
    public init(repository: SearchMoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getListMovies(keyword: String) -> Observable<[SearchModel]> {
        return repository.getListMovies(keyword: keyword).map({
            SearchMapper.mapEntityToDomain(entity: $0)
        })
    }
    
}
