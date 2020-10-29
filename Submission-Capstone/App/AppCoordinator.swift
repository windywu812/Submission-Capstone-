//
//  AppCoordinator.swift
//  Submission-Capstone
//
//  Created by Windy on 28/10/20.
//

import UIKit

class AppCoordinator {
    
    var homeRoot: UINavigationController?
    
    private let window: UIWindow
    private let tabBar: UITabBarController!
    private var homeNavController: UINavigationController!
    
    init(window: UIWindow) {
        self.window = window
        tabBar = UITabBarController()
    }
    
    func start() {

        setupHomeVC()
        
        tabBar.viewControllers = [
            homeNavController
        ]
        
        window.rootViewController = tabBar
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
    }
    
    func setupHomeVC() {
        let homeInteractor = Injection().provideHomeUseCase()
        let homePresenter = HomePresenter(interactor: homeInteractor)
        
        let homeVC = HomeViewController(presenter: homePresenter)
        homePresenter.view = homeVC
        homeVC.title = "iMovies"
        
        homeNavController = UINavigationController(rootViewController: homeVC)
        homeNavController.navigationBar.isTranslucent = false
        homeNavController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "airplayvideo"), tag: 0)
        
        homeRoot = homeNavController
    }
    
}
