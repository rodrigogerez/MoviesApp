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
    func fetchMovies(from movieRequest: MovieRequest, completion: @escaping (MoviesResponse) -> Void, errorHandler: @escaping (NetworkError) -> Void)
    func fetchMovieById(byId movieId: Int, completion: @escaping (MovieDetail) -> Void, errorHandler: @escaping (NetworkError) -> Void)
}

enum NetworkError: Error {
    case BadRequestError
    case WrongURLError
    case SerializationError
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
            case .BadRequestError:
                return K.NetworkConstants.badRequestErrorMessage
            case .WrongURLError:
                return K.NetworkConstants.wrongURLErrorMessage
            case .SerializationError:
                return K.NetworkConstants.serializationErrorMessage
        }
    }
}

class NetworkService: NetworkServiceProtocol {
    
    private let jsonDecoder: JSONDecoder = {
        var jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    } ()
    
    func fetchData<T: Codable>(from movieRequest: MovieRequest, completion: @escaping (T) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        guard let url = URL(string: "\(K.NetworkConstants.baseURL)\(movieRequest.path)") else {
            errorHandler(NetworkError.WrongURLError)
            return
        }
        
        Alamofire.request(url, parameters: movieRequest.parameters)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                    case .success(let data):
                        if let result = try? self.jsonDecoder.decode(T.self, from: data)
                        {
                            completion(result)
                        } else {
                            errorHandler(NetworkError.SerializationError)
                        }
                    case .failure(let error):
                        errorHandler(NetworkError.BadRequestError)
                        print(error.localizedDescription)
                        return
                }
        }
    }
    
    func fetchMovies(from movieRequest: MovieRequest, completion: @escaping (MoviesResponse) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        fetchData(from: movieRequest, completion: completion, errorHandler: errorHandler)
    }
    
    func fetchMovieById(byId movieId: Int, completion: @escaping (MovieDetail) -> Void, errorHandler: @escaping (NetworkError) -> Void) {
        fetchData(from: MovieRequest.findById(movieId), completion: completion, errorHandler: errorHandler)
    }
}
