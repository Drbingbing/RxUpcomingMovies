//
//  MoviesClientProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation
import RxSwift

protocol MoviesClientProtocol {
    
    func getUpcomingMovies(page: Int) -> Observable<MovieResult>
}
