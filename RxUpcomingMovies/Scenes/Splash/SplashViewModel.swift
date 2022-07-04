//
//  SplashViewModel.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import RxSwift

class SplashViewModel: SplashViewModelProtocol {
    
    let donwloadState = BehaviorSubject<DownloadState>(value: .idle)
    
    private let interactor: SplashInteractorProtocol
    private let configurationHandler: ConfigurationHandlerProtocol
    
    private let disposeBag = DisposeBag()

    init(interactor: SplashInteractorProtocol, configurationHandler: ConfigurationHandlerProtocol) {
        self.interactor = interactor
        self.configurationHandler = configurationHandler
    }
    
    func startInitialDownloads() {
        
        self.donwloadState.onNext(.start)
        
        let result = interactor.getAppConfiguration()
        
        result
            .subscribe(onNext: { [weak self] result in
                self?.updateAppConfiguration(result)
                self?.donwloadState.onNext(.end)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateAppConfiguration(_ configuration: MoviesConfiguration) {
        configurationHandler.setConfiguration(configuration)
    }
}
