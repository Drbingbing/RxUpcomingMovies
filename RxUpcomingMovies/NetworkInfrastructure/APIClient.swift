//
//  APIClient.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import RxSwift
import RxCocoa


protocol APIClient {
    
    var dependencies: NetworkDependenciesProtocol { get }
    
}
