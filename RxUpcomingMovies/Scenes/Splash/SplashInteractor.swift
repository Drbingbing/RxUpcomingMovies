//
//  SplashInteractor.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import RxSwift

struct SplashInteractor: SplashInteractorProtocol {
    
    private let configurationUseCase: ConfigurationRepositoryProtocol
    
    init(useCaseProvider: UserCaseProviderProtocol) {
        self.configurationUseCase = useCaseProvider.configurationRepository()
    }
    
    func getAppConfiguration() -> Observable<MoviesConfiguration> {
        configurationUseCase.getAppConfiguration()
    }
}
