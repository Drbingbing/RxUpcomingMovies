//
//  ConfigurationClien.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import RxSwift

final class ConfigurationClient: APIClient, ConfigurationClientProtocol {
    
    let dependencies: NetworkDependenciesProtocol
    
    init(dependencies: NetworkDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func getImagesConfiguration() -> Observable<ImagesConfigurationResult> {
        return fetch()
    }
    
    private func fetch() -> Observable<ImagesConfigurationResult> {
        
        let request = ConfigurationProvider.getAPIConfiguration.request
        
        return dependencies
            .session.rx
            .data(request: request)
            .observe(on: dependencies.backgroundWorkScheduler)
            .map { data in
                try JSONDecoder().decode(ImagesConfigurationResult.self, from: data)
            }
            .observe(on: dependencies.mainScheduler)
    }
}
