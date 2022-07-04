//
//  HandlerAssembly.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import Swinject

final class HandlerAssembly: Assembly {
    
    
    func assemble(container: Container) {
        container.register(NavigationHandlerProtocol.self) { _ in
            return DefaultNavigationHandler()
        }
        .inObjectScope(.container)
        
        container.register(ConfigurationHandlerProtocol.self) { _ in
            ConfigurationHandler()
        }
        .inObjectScope(.container)
    }
}
