//
//  ImageConfigurationHandler.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

struct ImageConfigurationHandler {
    
    private let configuration: MoviesConfiguration
    
    init(configuration: MoviesConfiguration) {
        self.configuration = configuration
    }
    
    private var baseURLString: String {
        return configuration.imagesConfiguration.baseURLString
    }

    var regularImageBaseURLString: String {
        let posterSize = configuration.imagesConfiguration.posterSizes.mid ?? Constants.defaultRegularSize
        return baseURLString + posterSize
    }

    var backdropImageBaseURLString: String {
        let backdropSize = configuration.imagesConfiguration.backdropSizes.mid ?? Constants.defaultBackdropSize
        return baseURLString + backdropSize
    }

}

// MARK: - Constants

extension ImageConfigurationHandler {

    struct Constants {

        static let defaultRegularSize = "w185"
        static let defaultBackdropSize = "w500"

        static let defaultRegularImageBaseURLString: String = "https://image.tmdb.org/t/p/w185"
        static let defaultBackdropImageBaseURLString: String = "https://image.tmdb.org/t/p/w500"
    }

}
