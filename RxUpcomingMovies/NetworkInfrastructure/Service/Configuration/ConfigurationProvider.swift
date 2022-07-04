//
//  ConfigurationProvider.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

enum ConfigurationProvider {
    
    case getAPIConfiguration
}

extension ConfigurationProvider: Endpoint {
    
    var base: String {
        return NetworkConfiguration.shared.baseAPIURLString
    }
    
    var path: String {
        switch self {
        case .getAPIConfiguration:
            return "/3/configuration"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAPIConfiguration:
            return nil
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case .getAPIConfiguration:
            return nil
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        switch self {
        case .getAPIConfiguration:
            return .defaultEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAPIConfiguration:
            return .get
        }
    }
}
