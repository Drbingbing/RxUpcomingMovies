//
//  Configuration.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/29.
//

import Foundation

struct MoviesConfiguration {
    
    let imagesConfiguration: ImagesConfiguration
    let sortConfiguration: SortConfiguration
    
    init(imagesConfiguration: ImagesConfiguration, sortConfiguration: SortConfiguration) {
        self.imagesConfiguration = imagesConfiguration
        self.sortConfiguration = sortConfiguration
    }
}
