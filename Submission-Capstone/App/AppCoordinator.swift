//
//  AppCoordinator.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit

class AppCoordinator {
        
    private let window: UIWindow
    private let tabBar: UITabBarController!
    
    private var homeNavController: UINavigationController!
    private var searchNavController: UINavigationController!
    private var watchlistNavController: UINavigationController!
    private var profileNavController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        tabBar = UITabBarController()
    }
    
    func start() {
        setupHomeVC()
        setupSearchVC()
        setupWachlistVC()
        setupProfileVC()
        
        tabBar.viewControllers = [
            homeNavController,
            searchNavController,
            watchlistNavController,
            profileNavController
        ]
                
        window.rootViewController = tabBar
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
    }
    
    private func setupHomeVC() {
        let homeInteractor = Injection.provideHomeUseCase()
        let homePresenter = HomePresenter(interactor: homeInteractor)
        
        let homeVC = HomeViewController(presenter: homePresenter)
        homePresenter.view = homeVC
        homeVC.title = "iMovies"
        
        homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.navigationBar.isTranslucent = false
        homeNavController.navigationBar.prefersLargeTitles = true
        homeNavController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "airplayvideo"), tag: 0)
    }
    
    private func setupSearchVC() {
        
        let searchInteractor = Injection.provideSearchUseCase()
        let searchPresenter = SearchPresenter(interactor: searchInteractor)
        
        let searchVC = SearchViewController(presenter: searchPresenter)
        searchPresenter.view = searchVC
        
        searchVC.title = "Search"
        
        searchNavController = UINavigationController(rootViewController: searchVC)
        searchNavController.navigationBar.isTranslucent = false
        searchNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
    }
    
    private func setupWachlistVC() {
        
        let watchlistInteractor = Injection.provideWatchlistUseCase()
        let watchlistPresenter = WatchlistPresenter(interactor: watchlistInteractor)
        
        let watchlistVC = WatchlistViewController(presenter: watchlistPresenter)
        watchlistPresenter.view = watchlistVC
        watchlistVC.title = "Watchlist"
        
        watchlistNavController = UINavigationController(rootViewController: watchlistVC)
        watchlistNavController.navigationBar.isTranslucent = false
        watchlistNavController.navigationBar.prefersLargeTitles = true
        watchlistNavController.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(systemName: "video"), tag: 2)
    }
    
    private func setupProfileVC() {
        
        let profileInteractor = Injection.provideProfileUseCase()
        let profilePresenter = ProfilePresenter(interactor: profileInteractor)
        
        let profileVC = ProfileViewController(presenter: profilePresenter)
        profileVC.title = "Profile"
        
        profileNavController = UINavigationController(rootViewController: profileVC)
        profileNavController.navigationBar.isTranslucent = false
        profileNavController.navigationBar.prefersLargeTitles = true
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
    }
    
}
