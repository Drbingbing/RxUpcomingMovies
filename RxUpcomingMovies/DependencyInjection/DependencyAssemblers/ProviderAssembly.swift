//
//  ProviderAssembly.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation
import Swinject

final class ProvdierAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UserCaseProviderProtocol.self) { resovler in
            guard let remoteDataSource = resovler.resolve(RemoteDataSourceProrocol.self) else {
                fatalError("RemoteDataSourceProtocol dependency could not be resolved")
            }
            
            return UserCaseProvider(remoteDataSource: remoteDataSource)
        }
    }
}
