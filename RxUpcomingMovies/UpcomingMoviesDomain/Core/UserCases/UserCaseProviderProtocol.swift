//
//  UserCaseProviderProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

protocol UserCaseProviderProtocol {
    
    func moviesRepository() -> MoviesRepositoryProtocol
    
    func configurationRepository() -> ConfigurationRepositoryProtocol
}
