//
//  MovieRepository.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import RxSwift

final class MoviesRepository: MoviesRepositoryProtocol {
    
    private let client: MoviesClientProtocol
    
    init(client: MoviesClientProtocol) {
        self.client = client
    }
    
    func getUpcomingMovies(page: Int) -> Observable<[Movie]> {
        client.getUpcomingMovies(page: page)
            .map { result in
                result.results
            }
    }
}
