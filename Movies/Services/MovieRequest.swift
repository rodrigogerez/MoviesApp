//
//  MovieRequest.swift
//  Movies
//
//  Created by Rodrigo Gerez on 09/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

enum MovieRequest {
    case upcoming
    case popular
    case topRated
    case findById(Int)
    
    var parameters: [String: Any] {
        var params = ["api_key": K.NetworkConstants.apiKey]
        switch self {
            case .findById(_):
                params["append_to_response"] = "videos,credits"
            default:
                break
        }
        return params
    }
    
    var path: String {
        switch self {
            case .upcoming:
                return "\(K.NetworkConstants.baseMoviePath)\(K.NetworkConstants.upcomingPath)"
            case .popular:
                return "\(K.NetworkConstants.baseMoviePath)\(K.NetworkConstants.popularPath)"
            case .topRated:
                return "\(K.NetworkConstants.baseMoviePath)\(K.NetworkConstants.topRatedPath)"
            case .findById(let id):
                return "\(K.NetworkConstants.baseMoviePath)\(id)"
        }
    }
}
