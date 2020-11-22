//
//  DataSource.swift
//  Core
//
//  Created by Windy on 20/11/20.
//

import RxSwift

public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) -> Observable<[Response]>
}
