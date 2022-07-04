//
//  DefaultNavigationHandler.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import UIKit

final class DefaultNavigationHandler: NavigationHandlerProtocol {
    
    func initialTransition(from window: UIWindow?) {
        guard let window = window else {
            return
        }

        let tabBar = UITabBarController()
        let viewController = UpcomingMoviesViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.title = "UpcomingMovies"
        nav.tabBarItem.image = UIImage(systemName: "film")
        tabBar.viewControllers = [nav]
        
        UIView.transition(
            with: window,
            duration: 0.5,
            options: [.transitionCrossDissolve],
            animations: {},
            completion: { _ in
                window.rootViewController = tabBar
            }
        )
    }
}
