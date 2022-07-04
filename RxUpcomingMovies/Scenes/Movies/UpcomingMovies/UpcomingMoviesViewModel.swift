//
//  UpcomingMoviesViewModel.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation
import RxSwift

final class UpcomingMoviesViewModel: UpcoimgMoviesViewModelProtocol {
    
    let movieSubject: BehaviorSubject<[Movie]> = BehaviorSubject(value: [])
    
    let errorSuject = PublishSubject<Error>()
    
    let currentPage = PublishSubject<Int>()
    
    let interactor: UpcomingMoviesInteractorProtocol
    
    var movieCells: [UpcomingMovieCellViewModelProtocol] {
        let movies = try? movieSubject.value()
        return (movies ?? [Movie]()).compactMap { UpcomingMovieCellViewModel($0) }
    }
    
    private let disposeBag = DisposeBag()
    
    init(interactor: UpcomingMoviesInteractorProtocol) {
        self.interactor = interactor
        self.binding()
    }
    
    private func binding() {
        let result = self.currentPage
            .flatMap(fetchMovies)
            .materialize()
            .share()
        
        result
            .compactMap(\.element)
            .subscribe(movieSubject)
            .disposed(by: disposeBag)
        
        result
            .compactMap { $0.error }
            .subscribe(errorSuject)
            .disposed(by: disposeBag)
    }
    
    func getMovies() {
        self.currentPage.onNext(1)
    }
    
    private func fetchMovies(page: Int) -> Observable<[Movie]> {
        self.interactor.getMovies(page: page)
    }
}
