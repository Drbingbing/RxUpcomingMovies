//
//  UpcomingMovieInteractor.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import RxSwift

final class UpcomingMovieInteractor: UpcomingMoviesInteractorProtocol {
    
    private let repository: MoviesRepositoryProtocol
    
    init(userCaseProvider: UserCaseProviderProtocol) {
        self.repository = userCaseProvider.moviesRepository()
    }
    
    func getMovies(page: Int) -> Observable<[Movie]> {
        self.repository.getUpcomingMovies(page: page)
    }
}
