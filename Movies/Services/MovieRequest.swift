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
    
    var path: String {
        switch self {
            case .upcoming:
                return K.NetworkConstants.upcomingPath
            case .popular:
                return K.NetworkConstants.popularPath
            case .topRated:
                return K.NetworkConstants.topRatedPath
        }
    }
}
