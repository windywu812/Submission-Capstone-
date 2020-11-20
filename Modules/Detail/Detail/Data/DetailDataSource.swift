//
//  DetailDataSource.swift
//  Detail
//
//  Created by Windy on 20/11/20.
//

import RxSwift
import CoreData
import Alamofire
import Common

public protocol DetailDataSourceProtocol: class {
    func getDetailMovie(idMovie: Int) -> Observable<DetailResponse>
    func checkIfFavorited(idMovie: Int) -> Bool
    func addToWatchlist(movie: DetailResponse)
}

public class DetailDataSource: NSObject {
    
    let moc: NSManagedObjectContext
    
    public init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
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
    
    public func addMovie(detail: DetailResponse) {

        if checkIfFavorited(idMovie: Int(detail.idMovie)) {
            print(checkIfFavorited(idMovie: Int(detail.idMovie)))
            deleteMovie(idMovie: Int(detail.idMovie))
        } else {
            let watchlist = Watchlist(context: moc)
            watchlist.idMovie = Int64(detail.idMovie)
            watchlist.overview = detail.overview
            watchlist.popularity = detail.popularity
            watchlist.posterPath = detail.posterPath
            watchlist.releaseDate = detail.releaseDate
            watchlist.title = detail.title

            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }

    }

    public func checkIfFavorited(idMovie: Int) -> Bool {

        let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
        fetchRequest.predicate = NSPredicate(format: "idMovie == \(Int64(idMovie))")
        fetchRequest.fetchLimit = 1
        do {
            let result = try moc?.fetch(fetchRequest)
            if Int64(idMovie) == result?.first?.idMovie {
                return true
            }
        } catch let err {
            print(err.localizedDescription)
        }

        return false

    }

    public func deleteMovie(idMovie: Int) {

        let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
        fetchRequest.predicate = NSPredicate(format: "idMovie == \(Int64(idMovie))")
        fetchRequest.fetchLimit = 1

        do {
            let result = try moc.fetch(fetchRequest)
            let dataToDelete = result[0]
            moc.delete(dataToDelete)
            try moc.save()
        } catch let err {
            print(err.localizedDescription)
        }

    }
    
}
