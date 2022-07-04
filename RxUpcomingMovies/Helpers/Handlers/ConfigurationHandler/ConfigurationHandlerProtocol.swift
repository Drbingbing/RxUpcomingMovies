//
//  ConfigurationHandlerProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

protocol ConfigurationHandlerProtocol {
    
    var regularImageBaseURLString: String { get }
    var backdropImageBaseURLString: String { get }
    
    func setConfiguration(_ configuraion: MoviesConfiguration)
}
