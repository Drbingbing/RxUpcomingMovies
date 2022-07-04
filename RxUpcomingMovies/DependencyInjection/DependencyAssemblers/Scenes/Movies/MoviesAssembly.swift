//
//  MoviesAssembly.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation
import Swinject

final class UpcomingMoviesAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(UpcomingMoviesInteractorProtocol.self) { resolver in
            guard let userCaseProvider = resolver.resolve(UserCaseProviderProtocol.self) else {
                fatalError("UserCaseProviderProtocol dependency could not resolved")
            }
            
            return UpcomingMovieInteractor(userCaseProvider: userCaseProvider)
        }
        
        container.register(UpcoimgMoviesViewModelProtocol.self) { resolver in
            guard let interactor = resolver.resolve(UpcomingMoviesInteractorProtocol.self) else {
                fatalError("MoviesInteractorProtocol dependency could not be resolved")
            }
            return UpcomingMoviesViewModel(interactor: interactor)
        }
    }
}
