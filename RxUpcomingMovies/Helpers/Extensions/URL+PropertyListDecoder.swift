//
//  URL+PropertyListDecoder.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

extension URL {
    
    func decodePropertyList<T: Decodable>() throws -> T {
        let data = try Data(contentsOf: self)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
