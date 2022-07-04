//
//  ConfigurationRepository.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import RxSwift


final class ConfigurationRepository: ConfigurationRepositoryProtocol {
    
    private let client: ConfigurationClientProtocol
    
    init(client: ConfigurationClientProtocol) {
        self.client = client
    }
    
    func getAppConfiguration() -> Observable<MoviesConfiguration> {
        let sortConfigurationResult = SortConfigurationResult(movieSortKeys: [])
        
        return client.getImagesConfiguration()
            .map { imagesConfiguration -> MoviesConfiguration in
                let configuration = Configuration(
                    imagesConfiguration: imagesConfiguration,
                    sortConfiguration: sortConfigurationResult
                )
                
                return configuration.asDomain()
            }
    }
}
