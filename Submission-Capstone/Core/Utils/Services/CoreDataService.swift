//
//  CoreDataManager.swift
//  Submission-Capstone
//
//  Created by Windy on 30/10/20.
//

import CoreData
import UIKit
import RxSwift
import Detail

class CoreDataService {
    
    static let shared = CoreDataService()
    
    func fetchFromCoreData() -> Observable<[Watchlist]> {
        return Observable<[Watchlist]>.create { observer in
            let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Watchlist>(entityName: "Watchlist")
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
    
    func addMovie(detail: DetailResponse) {
        
        fetchFromCoreData().observeOn(MainScheduler.instance)
            .subscribe { (result) in
                print(result)
            }
            .disposed(by: DisposeBag())

        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        
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
    
    func checkIfFavorited(idMovie: Int) -> Bool {
        
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
    
    func deleteMovie(idMovie: Int) {
        
        guard let moc = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
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

public class UserDefaultService {
    
    static private let imageKey = "imageKey"
    static private let nameKey = "nameKey"
    static private let expertKey = "expertKey"
    static private let emailKey = "emailKey"
    static private let educationKey = "educationKey"
    static private let phoneNumberKey = "phoneNumberKey"
    static private let locationKey = "locationKey"
    static private let achievementKey = "achievementKey"
    static private let hobbyKey = "hobbyKey"
    static private let linkedinKey = "linkedinKey"
    static private let githubKey = "githubKey"
    
    public static var image: String {
        get {
            return UserDefaults.standard.string(forKey: imageKey) ?? "profile"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: imageKey)
        }
    }
    
    public static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? "Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    public static var expert: String {
        get {
            return UserDefaults.standard.string(forKey: expertKey) ?? "iOS Developer"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: expertKey)
        }
    }
    
    public static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? "windywu812@gmail.com"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    public static var education: String {
        get {
            return UserDefaults.standard.string(forKey: educationKey) ?? "Information System"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: educationKey)
        }
    }
    
    public static var phoneNumber: String {
        get {
            return UserDefaults.standard.string(forKey: phoneNumberKey) ?? "089647527757"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: phoneNumberKey)
        }
    }
    
    public static var location: String {
        get {
            return UserDefaults.standard.string(forKey: locationKey) ?? "Batam"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: locationKey)
        }
    }
    
    public static var achievement: String {
        get {
            return UserDefaults.standard.string(forKey: achievementKey) ?? "Dicoding Graduate"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: achievementKey)
        }
    }
    
    public static var hobby: String {
        get {
            return UserDefaults.standard.string(forKey: hobbyKey) ?? "Coding"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hobbyKey)
        }
    }
    
    public static var linkedIn: String {
        get {
            return UserDefaults.standard.string(forKey: linkedinKey) ?? "Windy Windy"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: linkedinKey)
        }
    }
    
    public static var github: String {
        get {
            return UserDefaults.standard.string(forKey: githubKey) ?? "http://github.com/windywu812"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: githubKey)
        }
    }
    
}

