//
//  ImageService.swift
//  Movies
//
//  Created by Rodrigo Gerez on 15/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation
import Alamofire

protocol ImageServiceProtocol {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}

enum ImageError: Error {
    case BadRequest
}

extension ImageError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .BadRequest:
                return K.ImageConstants.badRequestErrorMessage
        }
    }
}


class ImageService: ImageServiceProtocol {
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {            
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }
            
        dataTask.resume()
    }
}
