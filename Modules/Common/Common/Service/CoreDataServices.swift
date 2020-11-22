//
//  CoreDataServices.swift
//  Common
//
//  Created by Windy on 20/11/20.
//

import CoreData
import RxSwift

public class CoreDataService {
    
    public static let shared = CoreDataService()
    
    let identifier: String = "com.windy.Common"
    let model: String = "CoreDataModel"
    
    lazy var persistentContainer: NSPersistentContainer = {
        let bundle = Bundle(identifier: identifier)
        let modelURL = bundle!.url(forResource: model, withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (_, error) in
            if let err = error {
                fatalError("Loading of store failed: \(err)")
            }
        }
        
        return container
    }()
    
    public func fetchFromCoreData() -> Observable<[Watchlist]> {
        return Observable<[Watchlist]>.create { observer in
            let moc = self.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
            do {
                let results = try moc.fetch(fetchRequest)
                observer.onNext(results)
            } catch let err {
                print(err.localizedDescription)
                observer.onError(err)
            }
            return Disposables.create()
        }
    }

    public func addMovie(
        idMovie: Int,
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String
    ) {

        let moc = self.persistentContainer.viewContext

        if checkIfFavorited(idMovie: idMovie) {
            print(checkIfFavorited(idMovie: idMovie))
            deleteMovie(idMovie: idMovie)
        } else {
            let watchlist = Watchlist(context: moc)
            watchlist.idMovie = Int64(idMovie)
            watchlist.overview = overview
            watchlist.popularity = popularity
            watchlist.posterPath = posterPath
            watchlist.releaseDate = releaseDate
            watchlist.title = title

            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }

    }

    public func checkIfFavorited(idMovie: Int) -> Bool {

        let moc = self.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
        fetchRequest.predicate = NSPredicate(format: "idMovie == \(Int64(idMovie))")
        fetchRequest.fetchLimit = 1
        do {
            let result = try moc.fetch(fetchRequest)
            if Int64(idMovie) == result.first?.idMovie {
                return true
            }
        } catch let err {
            print(err.localizedDescription)
        }

        return false

    }

    public func deleteMovie(idMovie: Int) {

        let moc = self.persistentContainer.viewContext
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
