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
        static let upcomingPath = "/movie/upcoming"
        static let popularPath = "/movie/popular"
        static let topRatedPath = "/movie/top_rated"
    }
    
}
