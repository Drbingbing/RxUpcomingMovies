//
//  DataSourceAssembly.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Swinject

final class DataSourceAssembly: Assembly {
    
    
    func assemble(container: Container) {
        container.register(RemoteDataSourceProrocol.self) { _ in
            return RemoteDataSource()
        }
    }
}
