//
//  SplashBuilder.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import UIKit

final class SplashBuilder {
    
    class func buildViewController() -> UIViewController {
        
        let viewController = SplashViewController.instantiate()
        viewController.viewModel = DIContainer.shared.resolve()
        let nav = UINavigationController(rootViewController: viewController)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [nav]
        
        return tabBarController
    }
}
