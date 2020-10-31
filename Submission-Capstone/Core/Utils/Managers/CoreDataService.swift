//
//  CoreDataManager.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import CoreData
import UIKit
import RxSwift

class CoreDataService {
    
    static let shared = CoreDataService()
    
    func fetchFromCoreData() -> Observable<[Movie]> {
        return Observable<[Movie]>.create { observer in
            let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
            
            do {
                let results = try moc?.fetch(fetchRequest)
                observer.onNext(results ?? [])
            } catch let err {
                print(err.localizedDescription)
                observer.onError(err)
            }
            
            return Disposables.create()
        }
    }
    
    func addMovie(detail: DetailModel) {
        
        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        if checkIfFavorited(idMovie: detail.idMovie) {

            deleteMovie(idMovie: Int64(detail.idMovie))

        } else {
            
            let movie = Movie(context: moc)
            movie.idMovie = Int64(detail.idMovie)
            movie.overview = detail.overview
            movie.title = detail.title
            movie.posterPath = detail.posterPath
            
            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    func checkIfFavorited(idMovie: Int) -> Bool {
        
        let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
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
    
    func deleteMovie(idMovie: Int64) {
        
        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Movie>(entityName: "Movie")
        fetchRequest.predicate = NSPredicate(format: "idMovie == \(idMovie)")
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
