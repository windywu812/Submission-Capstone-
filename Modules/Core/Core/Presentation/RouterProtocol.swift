//
//  RouterProtocol.swift
//  Core
//
//  Created by Windy on 20/11/20.
//

import UIKit

public protocol GenericRouter {
    func goToDetailView(idMovie: Int) -> UIViewController
    func goToSeeAllView<T>(movies: [T]) -> UIViewController?
}
