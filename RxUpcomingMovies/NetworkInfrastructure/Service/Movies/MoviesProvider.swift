//
//  MoviesProvider.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation

enum MovieProvider {
    case getUpcoming(page: Int)
}

extension MovieProvider: Endpoint {
    
    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }
    
    var path: String {
        switch self {
        case .getUpcoming:
            return "/3/movie/upcoming"
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var params: [String : Any]? {
        switch self {
        case .getUpcoming(let page):
            return ["page": page]
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        return .defaultEncoding
    }
    
    var method: HTTPMethod {
        return .get
    }
}
