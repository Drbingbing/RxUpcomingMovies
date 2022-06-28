//
//  BaseConfiguration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

struct BaseConfiguration: Decodable {
    
    struct Keys: Decodable {
        let readAccessToken: String
        let apiKey: String
        
        private enum CodingKeys: String, CodingKey {
            case readAccessToken = "ReadAccessToken"
            case apiKey = "ApiKey"
        }
    }
    
    let keys: Keys
    
    private enum CodingKeys: String, CodingKey {
        case keys = "TheMovieDb"
    }
}
