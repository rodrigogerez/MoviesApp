//
//  HomeViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

//MARK: HomeViewModelProtocol
protocol HomeViewModelProtocol {
    func fetchMovies(completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void)
}

//MARK: HomeViewModel
class HomeViewModel: HomeViewModelProtocol {
    let networkService: NetworkService
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
        networkService.fetchMovies(from: movieRequest, completion: completion, errorHandler: errorHandler)
    }
    
    init(_ index: Int) {
        self.networkService = NetworkService()
        self.index = index
    }
}
