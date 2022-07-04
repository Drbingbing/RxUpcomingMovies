//
//  Movie.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/7/1.
//

import Foundation

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let genreIds: [Int]?
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double?

    // MARK: - Initializers

    init(id: Int, title: String, genreIds: [Int]?,
         overview: String, posterPath: String?, backdropPath: String?,
         releaseDate: String?, voteAverage: Double?) {
        self.id = id
        self.title = title
        self.genreIds = genreIds
        self.overview = overview
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case genreIds = "genre_ids"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

//extension Movie {
//    
//    struct AccountState: Equatable {
//        
//        let favorite: Bool
//        let watchlist: Bool
//        
//        init(favorite: Bool, watchlist: Bool) {
//            self.favorite = favorite
//            self.watchlist = watchlist
//        }
//    }
//}
