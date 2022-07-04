//
//  SplashProtocols.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import RxSwift

protocol SplashViewModelProtocol {

    var donwloadState: BehaviorSubject<DownloadState> { get }
    
    func startInitialDownloads()
}

protocol SplashInteractorProtocol {
    
    func getAppConfiguration() -> Observable<MoviesConfiguration>
}


enum DownloadState {
    case idle
    case start
    case end
}
