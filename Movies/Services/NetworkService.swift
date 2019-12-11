//
//  NetworkService.swift
//  Movies
//
//  Created by Rodrigo Gerez on 04/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func fetchMovies(from movieRequest: MovieRequest,completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void)
}

enum NetworkError: Error {
    case BadRequestError
    case WrongURLError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .BadRequestError:
                return K.NetworkConstants.badRequestErrorMessage
            case .WrongURLError:
                return K.NetworkConstants.badRequestErrorMessage
        }
    }
}

class NetworkService: NetworkServiceProtocol {
    
    let jsonDecoder: JSONDecoder = {
        var jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    } ()
    
    var parameters: [String: Any] {
        let params = ["api_key": K.NetworkConstants.apiKey]
        
        return params
    }
    
    func fetchMovies(from movieRequest: MovieRequest,completion: @escaping ([Movie]?) -> Void, errorHandler: @escaping (NetworkError) -> Void){
        
        guard let url = URL(string: "\(K.NetworkConstants.baseURL)\(movieRequest.path)") else {
            errorHandler(NetworkError.WrongURLError)
            return
        }
        
        Alamofire.request(url, parameters: parameters)
            .validate(contentType: ["application/json"])
            .response { response in
            guard let data = response.data else { return }
            do {
                let result = try self.jsonDecoder.decode(MoviesResponse.self, from: data)
                completion(result.results)
              
            } catch {
                errorHandler(NetworkError.BadRequestError)
            }
      }
        
    }
}
