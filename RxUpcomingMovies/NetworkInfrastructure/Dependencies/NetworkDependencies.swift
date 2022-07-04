//
//  NetworkDependencies.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import RxSwift

protocol NetworkDependenciesProtocol {
    
    var session: URLSession { get }
    
    var backgroundWorkScheduler: ImmediateSchedulerType { get }
    
    var mainScheduler: SerialDispatchQueueScheduler { get }
}
