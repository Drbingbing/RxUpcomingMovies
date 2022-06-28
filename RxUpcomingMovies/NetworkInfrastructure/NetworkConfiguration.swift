//
//  NetworkConfiguration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

final class NetworkConfiguration {
    
    static let shared = NetworkConfiguration()
    
    private init() {}
    
    private(set) var apiKey: String = ""
    private(set) var readAccessToken: String = ""
    
    var baseAPIURLString: String {
        return "https://api.themoviedb.org"
    }
    
    func configure(with apiKey: String, and readAccessToken: String) {
        self.apiKey = apiKey
        self.readAccessToken = readAccessToken
    }
}
