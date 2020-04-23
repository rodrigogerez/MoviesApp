//
//  HomeViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

//MARK: HomeViewModelProtocol
protocol HomeViewModelProtocol {
    func fetchMovies(completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void)
}

//MARK: HomeViewModel
class HomeViewModel: HomeViewModelProtocol {
    let networkService: NetworkServiceProtocol
    var index: Int
    
    var movieRequest: MovieRequest {
        switch self.index {
        case 0:
            return .upcoming
        case 1:
            return .popular
        case 2:
            return .topRated
        
        default:
            return .upcoming
        }
    }
    
    func fetchMovies(completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        networkService.fetchMovies(from: movieRequest, completion: { response in
            completion(response.results)
            }, errorHandler: errorHandler)

    }
    
    init(_ index: Int, networkService: NetworkService) {
        self.networkService = networkService
        self.index = index
    }
}
