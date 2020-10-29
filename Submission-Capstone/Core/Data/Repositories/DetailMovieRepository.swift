//
//  DetailMovieRepository.swift
//  Submission-Capstone
//
//  Created by Windy on 29/10/20.
//

import RxSwift

protocol DetailMovieRepositoryProtocol {
    func getDetail(idMovie: Int) -> Observable<DetailModel>
}

class DetailMovieRepository {
    
    typealias DetailMovieInstance = (DetailDataSource) -> DetailMovieRepository
    let remote: DetailDataSource
    
    private init(remote: DetailDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: DetailMovieInstance = { remote in
        return DetailMovieRepository(remote: remote)
    }
    
}

extension DetailMovieRepository: DetailMovieRepositoryProtocol {
    
    func getDetail(idMovie: Int) -> Observable<DetailModel> {
        let detail = remote.getDetailMovie(idMovie: idMovie)

        return detail.map { (detail) in
            return MovieMapper.mapResponseDetailToDetailModel(input: detail)
        }
    }
    
}
