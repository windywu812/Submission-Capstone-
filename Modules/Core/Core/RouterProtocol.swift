//
//  RouterProtocol.swift
//  Core
//
//  Created by Windy on 20/11/20.
//

import Foundation

public protocol GenericRouter {
    associatedtype RootView
    associatedtype Destination
    
    func goToDetailView(rootView: RootView) -> Destination
    func goToSeeAllView(rootView: RootView) -> Destination
}
