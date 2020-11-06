//
//  SearchMoviesRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import RxSwift

protocol SearchMoviesRepositoryProtocol {
    func getListMovies(keyword: String) -> Observable<[MovieModel]>
}

class SearchMoviesRepository {
    
    typealias SearchMoviesInstance = (SearchDataSource) -> SearchMoviesRepository
    let remote: SearchDataSourceProtocol
    
    private init(remote: SearchDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: SearchMoviesInstance = { remote in
        return SearchMoviesRepository(remote: remote)
    }
    
}

extension SearchMoviesRepository: SearchMoviesRepositoryProtocol {
    
    func getListMovies(keyword: String) -> Observable<[MovieModel]> {
        return remote.getListMovies(keyword: keyword)
            .map({ MovieMapper.mapResponseToMovieModel(input: $0) })
    }
    
}
