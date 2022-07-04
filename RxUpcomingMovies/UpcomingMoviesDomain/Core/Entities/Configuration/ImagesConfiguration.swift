//
//  ImagesConfiguration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation

struct ImagesConfiguration: Decodable {
    
    let baseURLString: String
    let backdropSizes: [String]
    let posterSizes: [String]

    private enum CodingKeys: String, CodingKey {
        case baseURLString = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case posterSizes = "poster_sizes"
    }
}
