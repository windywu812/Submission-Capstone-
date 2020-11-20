//
//  UseCase.swift
//  Core
//
//  Created by Windy on 20/11/20.
//

import RxSwift

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) -> Observable<[Response]>
}
