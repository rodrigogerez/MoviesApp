//
//  Constant.swift
//  Movies
//
//  Created by Rodrigo Gerez on 02/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

struct K {
    struct AuthConstants {
        static let fieldEmptyErrorMessage = "Please, complete all the fields"
        static let validateErrorMessage = "Invalid username/password"
        static let registerErrorMessage = "Has been an unespected error. Please, try again"
        static let passwordDoesNotMatchErrorMessage = "Both passwords must be the same"
        static let userAlreadyExistErrorMessage = "The username is already registered. Please, try another one"
    }
    
    struct NetworkConstants {
        static let baseURL = "https://api.themoviedb.org/3"
        static let apiKey = "4e7b644c6c3b7913ea05de2841c75dfb"
        static let badRequestErrorMessage = "Has been an error. Please, try again!"
        static let wrongURLErrorMessage = "The URL is wrong. Please, try again!"
        static let serializationErrorMessage = "Has been an error trying to serialize the incoming object."
        static let baseMoviePath = "/movie/"
        static let upcomingPath = "upcoming"
        static let popularPath = "popular"
        static let topRatedPath = "top_rated"
    }
    
    struct ImageConstants {
        static let baseImageURL = "https://image.tmdb.org/t/p/w500"
        static let badRequestErrorMessage = "Cannot get an image. Please, try again!"
    }
}
