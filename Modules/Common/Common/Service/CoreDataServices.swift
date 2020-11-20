//
//  CoreDataServices.swift
//  Common
//
//  Created by Windy on 20/11/20.
//

import CoreData
import UIKit
import RxSwift

//class CoreDataService {
//    
//    static let shared = CoreDataService()
//    
//    func fetchFromCoreData() -> Observable<[Watchlist]> {
//        return Observable<[Watchlist]>.create { observer in
//            let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
//            do {
//                let results = try moc?.fetch(fetchRequest)
//                observer.onNext(results ?? [])
//            } catch let err {
//                print(err.localizedDescription)
//                observer.onError(err)
//            }
//            return Disposables.create()
//        }
//    }
//    
//    func addMovie(detail: DetailResponse) {
//        
//        fetchFromCoreData().observeOn(MainScheduler.instance)
//            .subscribe { (result) in
//                print(result)
//            }
//            .disposed(by: DisposeBag())
//
//        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
//        
//        if checkIfFavorited(idMovie: Int(detail.idMovie)) {
//            print(checkIfFavorited(idMovie: Int(detail.idMovie)))
//            deleteMovie(idMovie: Int(detail.idMovie))
//        } else {
//            let watchlist = Watchlist(context: moc)
//            watchlist.idMovie = Int64(detail.idMovie)
//            watchlist.overview = detail.overview
//            watchlist.popularity = detail.popularity
//            watchlist.posterPath = detail.posterPath
//            watchlist.releaseDate = detail.releaseDate
//            watchlist.title = detail.title
//            
//            do {
//                try moc.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        
//    }
//    
//    func checkIfFavorited(idMovie: Int) -> Bool {
//        
//        let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
//        fetchRequest.predicate = NSPredicate(format: "idMovie == \(Int64(idMovie))")
//        fetchRequest.fetchLimit = 1
//        do {
//            let result = try moc?.fetch(fetchRequest)
//            if Int64(idMovie) == result?.first?.idMovie {
//                return true
//            }
//        } catch let err {
//            print(err.localizedDescription)
//        }
//        
//        return false
//        
//    }
//    
//    func deleteMovie(idMovie: Int) {
//        
//        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
//        let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
//        fetchRequest.predicate = NSPredicate(format: "idMovie == \(Int64(idMovie))")
//        fetchRequest.fetchLimit = 1
//        
//        do {
//            let result = try moc.fetch(fetchRequest)
//            let dataToDelete = result[0]
//            moc.delete(dataToDelete)
//            try moc.save()
//        } catch let err {
//            print(err.localizedDescription)
//        }
//        
//    }
//    
//}
//
