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
    private var favoriteNavController: UINavigationController!
    private var profileNavController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        tabBar = UITabBarController()
    }
    
    func start() {

        setupHomeVC()
        setupSearchVC()
        setupFavoriteVC()
        setupProfileVC()
        
        tabBar.viewControllers = [
            homeNavController,
            searchNavController,
            favoriteNavController,
            profileNavController
        ]
        
        window.rootViewController = tabBar
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
    }
    
    private func setupHomeVC() {
        let homeInteractor = Injection().provideHomeUseCase()
        let homePresenter = HomePresenter(interactor: homeInteractor)
        
        let homeVC = HomeViewController(presenter: homePresenter)
        homePresenter.view = homeVC
        homeVC.title = "iMovies"
        
        homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.navigationBar.isTranslucent = false
        homeNavController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "airplayvideo"), tag: 0)
    }
    
    private func setupSearchVC() {
        
        let searchInteractor = Injection().provideSearchUseCase(keyword: "")
        let searchPresenter = SearchPresenter(interactor: searchInteractor)
        
        let searchVC = SearchViewController(presenter: searchPresenter)
        searchPresenter.view = searchVC
        
        searchVC.title = "Search"
        
        searchNavController = UINavigationController(rootViewController: searchVC)
        searchNavController.navigationBar.isTranslucent = false
        searchNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
    }
    
    private func setupFavoriteVC() {
        
        let favoriteVC = FavoriteViewController()
        
        favoriteNavController = UINavigationController(rootViewController: favoriteVC)
        favoriteNavController.navigationBar.isTranslucent = false
        favoriteNavController.tabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(systemName: "video"), tag: 2)
    }
    
    private func setupProfileVC() {
        
        let profileVC = ProfileViewController()
        
        profileNavController = UINavigationController(rootViewController: profileVC)
        profileNavController.navigationBar.isTranslucent = false
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
    }
    
}
