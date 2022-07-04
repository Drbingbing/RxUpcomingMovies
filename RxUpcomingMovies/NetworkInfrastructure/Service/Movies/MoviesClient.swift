//
//  MoviesClient.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import RxSwift


final class MoviesClient: MoviesClientProtocol, APIClient {
    
    let dependencies: NetworkDependenciesProtocol
    
    init(dependencies: NetworkDependenciesProtocol) {
        self.dependencies = dependencies
    }
    
    func getUpcomingMovies(page: Int) -> Observable<MovieResult> {
        let request = MovieProvider.getUpcoming(page: page).request
        
        return dependencies.session.rx
            .data(request: request)
            .observe(on: dependencies.backgroundWorkScheduler)
            .map { data in
                try JSONDecoder().decode(MovieResult.self, from: data)
            }
            .observe(on: dependencies.mainScheduler)
    }
}
