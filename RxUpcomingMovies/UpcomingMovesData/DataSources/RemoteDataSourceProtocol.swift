//
//  RemoteDataSourceProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

protocol RemoteDataSourceProrocol {
    
    func configure(with apiKey: String, and readAccessToken: String)
    
    func networkDependencies() -> NetworkDependenciesProtocol
}
