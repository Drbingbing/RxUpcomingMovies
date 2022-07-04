//
//  SplashAssembly.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import Swinject

final class SplashAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(SplashInteractorProtocol.self) { resolver in
            guard let userCaseProvider = resolver.resolve(UserCaseProviderProtocol.self) else {
                fatalError("UserCaseProviderProtocol dependency could not resolved")
            }
            return SplashInteractor(useCaseProvider: userCaseProvider)
        }
        
        container.register(SplashViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(SplashInteractorProtocol.self) else {
                fatalError("SplashViewModelProtocol dependency could not resolved")
            }
            guard let configurationHandler = resolver.resolve(ConfigurationHandlerProtocol.self) else {
                fatalError("ConfigurationHandlerProtocol dependency could not be resolved")
            }
            return SplashViewModel(interactor: interactor, configurationHandler: configurationHandler)
        }
    }
}
