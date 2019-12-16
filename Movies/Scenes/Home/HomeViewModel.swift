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
    let networkService: NetworkService
    let imageService: ImageService
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
    
    func downloadImage(from url: URL) -> Result<UIImage?, ImageError> {
        var image: UIImage?
        
        let group = DispatchGroup()
        group.enter()
        
        imageService.getData(from: url) { data, response, error in
            guard let data = data, error == nil else {
                group.leave()
                return
            }
            DispatchQueue.global().async {
                image = UIImage(data: data)
                group.leave()
            }
        }
        
        group.wait()
        return .success(image)
        
    }
    
    init(_ index: Int) {
        self.networkService = NetworkService()
        self.imageService = ImageService()
        self.index = index
    }
}
