//
//  Configuration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation
import SwiftyJSON

struct ImagesConfigurationResult: Decodable {
    
    let result: ImagesConfiguration
    
    private enum CodingKeys: String, CodingKey {
        case result = "images"
    }
    
}

struct SortConfigurationResult {

    let movieSortKeys: [String]

}

struct Configuration {

    let imagesConfiguration: ImagesConfigurationResult
    let sortConfiguration: SortConfigurationResult

    var baseURLString: String {
        return imagesConfiguration.result.baseURLString
    }

    var backdropSizes: [String] {
        return imagesConfiguration.result.backdropSizes
    }

    var posterSizes: [String] {
        return imagesConfiguration.result.posterSizes
    }

    var movieSortKeys: [String] {
        return sortConfiguration.movieSortKeys
    }

}

protocol DomainConvertible {
    
    associatedtype Domain
    
    func asDomain() -> Domain
}

extension Configuration: DomainConvertible {
    
    func asDomain() -> MoviesConfiguration {
        let imageConfiguration = ImagesConfiguration(
            baseURLString: baseURLString,
            backdropSizes: backdropSizes,
            posterSizes: posterSizes
        )
        let sortConfiguration = SortConfiguration(moviesSortKeys: movieSortKeys)
        
        return MoviesConfiguration(imagesConfiguration: imageConfiguration, sortConfiguration: sortConfiguration)
    }
}
