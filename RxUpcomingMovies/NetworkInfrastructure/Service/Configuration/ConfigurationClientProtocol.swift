//
//  ConfigurationClientProtocol.swift
//  RxUpcomingMovies
//
//  Created by Bing Bing on 2022/6/30.
//

import RxSwift

protocol ConfigurationClientProtocol {
    func getImagesConfiguration() -> Observable<ImagesConfigurationResult>
}
