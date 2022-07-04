//
//  UpcoimgMoviesProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation
import RxSwift

protocol UpcoimgMoviesViewModelProtocol {
    
    var currentPage: PublishSubject<Int> { get }
    
    var movieSubject: BehaviorSubject<[Movie]> { get }
    
    var errorSuject: PublishSubject<Error> { get }
    
    var movieCells: [UpcomingMovieCellViewModelProtocol] { get }
    
    func getMovies()
}

protocol UpcomingMoviesInteractorProtocol {
    
    func getMovies(page: Int) -> Observable<[Movie]>
}

