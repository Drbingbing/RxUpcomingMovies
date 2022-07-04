//
//  Array+MidElement.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import Foundation

extension Array {
    
    var mid: Element? {
        guard count != 0 else { return nil }
        let midIndex = (count > 1 ? count - 1 : count) / 2
        return self[midIndex]
    }
}
