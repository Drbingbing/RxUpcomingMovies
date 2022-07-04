//
//  LaunchViewController.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController, Storyboarded {
    
    static var storyboardName: String { return "Splash" }
    
    var viewModel: SplashViewModelProtocol!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.startAnimating()
        self.binding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.startInitialDownloads()
    }
    
    private func binding() {
        
        viewModel.donwloadState
            .asObserver()
            .subscribe(onNext: { [weak self] state in
                guard let self = self, state == .end else { return }
                let navigationHandler: NavigationHandlerProtocol = DIContainer.shared.resolve()
                navigationHandler.initialTransition(from: self.view.window)
            })
            .disposed(by: disposeBag)
        
    }
}
