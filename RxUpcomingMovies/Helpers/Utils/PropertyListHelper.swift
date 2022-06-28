//
//  PropertyListHelper.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/28.
//

import Foundation

struct PropertyListHelper {
    
    
    static func decode<T: Decodable>(resourceName: String = "Info") -> T {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: ".plist") else {
            fatalError("unable to decode resourceName: \(resourceName)")
        }
        
        do {
            let basePrameters: T = try url.decodePropertyList()
            return basePrameters
        } catch {
            fatalError("fail to decode, type: \(T.self)")
        }
    }
}
