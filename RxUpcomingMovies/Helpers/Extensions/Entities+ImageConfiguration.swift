//
//  Entities+ImageConfiguration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation

protocol ImageConfigurable {
    
    var regularImageBaseURLString: String { get }
    var backdropImageBaseURLString: String { get }
}

extension ImageConfigurable {
    
    var configurationHandler: ConfigurationHandlerProtocol {
        DIContainer.shared.resolve()
    }
    
    var regularImageBaseURLString: String {
        configurationHandler.regularImageBaseURLString
    }
    
    var backdropImageBaseURLString: String {
        configurationHandler.backdropImageBaseURLString
    }
}

extension Movie: ImageConfigurable {
    
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        
        let urlString = regularImageBaseURLString.appending(posterPath)
        return URL(string: urlString)
    }
    
    var backdropURL: URL? {
        guard let backdropPath = backdropPath else { return nil }
        let urlString = backdropImageBaseURLString.appending(backdropPath)
        return URL(string: urlString)
    }
}
