//
//  MoviesResult.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation

struct MovieResult: Decodable {
    
    let results: [Movie]
    var currentPage: Int
    var totalPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case results
        case currentPage = "page"
        case totalPages = "total_pages"
    }

}
