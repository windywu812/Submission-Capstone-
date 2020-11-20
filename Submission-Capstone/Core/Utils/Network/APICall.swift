//
//  APICall.swift
//  Submission-Capstone
//
//  Created by Windy on 27/10/20.
//

import Foundation

struct API {
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "d407611be29fb837a1b17e4e981cae5c"
    static let imageLoaderURL = "https://image.tmdb.org/t/p/w500/"
}

enum Endpoints {
    case nowPlaying
    case popular
    case topRated
    case upComing
    case detail(String)
    case search(String)
    
    var url: String {
        switch self {
        case .nowPlaying:
            return "\(API.baseUrl)now_playing?api_key=\(API.apiKey)&language=en-US&page=1"
        case .popular:
            return "\(API.baseUrl)popular?api_key=\(API.apiKey)&language=en-US&page=1"
        case .upComing:
            return "\(API.baseUrl)upcoming?api_key=\(API.apiKey)&language=en-US&page=1"
        case .topRated:
            return "\(API.baseUrl)top_rated?api_key=\(API.apiKey)&language=en-US&page=1"
        case .detail(let idMovie):
            return "\(API.baseUrl)\(idMovie)?api_key=\(API.apiKey)&language=en-US"
        case .search(let search):
            return "https://api.themoviedb.org/3/search/movie?api_key=\(API.apiKey)&language=en-US&query=\(search)&page=1&include_adult=false"
        }
    }
}
