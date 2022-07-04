//
//  UserCaseProvider.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

final class UserCaseProvider: UserCaseProviderProtocol {
    
    private let remoteDataSource: RemoteDataSourceProrocol
    
    init(remoteDataSource: RemoteDataSourceProrocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func configurationRepository() -> ConfigurationRepositoryProtocol {
        let dependencies = remoteDataSource.networkDependencies()
        let client = ConfigurationClient(dependencies: dependencies)
        
        return ConfigurationRepository(client: client)
    }
    
    func moviesRepository() -> MoviesRepositoryProtocol {
        let dependencies = remoteDataSource.networkDependencies()
        let client = MoviesClient(dependencies: dependencies)
        
        return MoviesRepository(client: client)
    }
}
