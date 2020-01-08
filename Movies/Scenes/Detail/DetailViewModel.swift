//
//  DetailViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 23/12/2019.
//  Copyright © 2020 Rodrigo Gerez. All rights reserved.
//

import UIKit

//MARK: DetailViewModelProtocol
protocol DetailViewModelProtocol {
    
}

//MARK: DetailViewModel
class DetailViewModel: DetailViewModelProtocol {
    let networkService: NetworkServiceProtocol
    var id: Int
    
    func fetchMovieDetails(completion: @escaping (MovieDetail?) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        networkService.fetchMovieById(byId: id, completion: completion, errorHandler: errorHandler)
    }
    
    init(_ index: Int) {
        self.networkService = NetworkService()
        self.id = index
    }
}
