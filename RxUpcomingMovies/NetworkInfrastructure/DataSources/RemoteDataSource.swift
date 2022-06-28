//
//  RemoteDataSource.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

final class RemoteDataSource: RemoteDataSourceProrocol {
    
    
    func configure(with apiKey: String, and readAccessToken: String) {
        NetworkConfiguration.shared.configure(with: apiKey, and: readAccessToken)
    }
}
