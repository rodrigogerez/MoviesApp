//
//  SearchViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/01/2020.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import Foundation

protocol SearchViewModelProtocol {
    func fetchMoviesByTitle(byTitle title: String, completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void)
}

class SearchViewModel: SearchViewModelProtocol {
    var networkService: NetworkServiceProtocol!
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMoviesByTitle(byTitle title: String, completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        networkService.fetchMoviesByTitle(byTitle: title, completion: { response in
            completion(response.results)
        }, errorHandler: errorHandler)
    }
}
