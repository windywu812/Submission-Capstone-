//
//  MovieRouter.swift
//  Movie
//
//  Created by Windy on 20/11/20.
////
//
import UIKit

public protocol MovieRouterProtocol {
    func goToDetailView(idMovie: Int) -> UIViewController
    func goToSeeAllView(movies: [MovieModel]) -> UIViewController
}
