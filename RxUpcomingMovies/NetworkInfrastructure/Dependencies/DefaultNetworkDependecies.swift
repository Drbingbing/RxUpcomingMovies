//
//  DefaultNetworkDependecies.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import RxSwift

final class DefaultNetworkDependencies: NetworkDependenciesProtocol {
    
    let session: URLSession
    
    let backgroundWorkScheduler: ImmediateSchedulerType
    
    let mainScheduler: SerialDispatchQueueScheduler
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        operationQueue.qualityOfService = QualityOfService.userInitiated
        self.backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        
        self.mainScheduler = MainScheduler.instance
    }
    
    convenience init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        
        self.init(configuration: configuration)
    }
}
