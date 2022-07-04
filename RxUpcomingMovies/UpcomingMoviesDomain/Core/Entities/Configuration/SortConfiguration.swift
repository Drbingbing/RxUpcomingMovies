//
//  SortConfiguration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation

struct SortConfiguration {
    
    let movieSortKeys: [String]
    
    init(moviesSortKeys: [String]) {
        self.movieSortKeys = moviesSortKeys
    }
}
