//
//  ConfigurationHandler.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

final class ConfigurationHandler: ConfigurationHandlerProtocol {
    
    private var imageConfiguration: ImageConfigurationHandler?
    
    var regularImageBaseURLString: String {
        imageConfiguration?.regularImageBaseURLString ?? ImageConfigurationHandler.Constants.defaultRegularImageBaseURLString
    }
    
    var backdropImageBaseURLString: String {
        imageConfiguration?.backdropImageBaseURLString ?? ImageConfigurationHandler.Constants.defaultBackdropImageBaseURLString
    }
    
    func setConfiguration(_ configuraion: MoviesConfiguration) {
        self.imageConfiguration = ImageConfigurationHandler(configuration: configuraion)
    }
}
