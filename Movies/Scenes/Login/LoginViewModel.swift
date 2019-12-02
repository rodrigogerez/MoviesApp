//
//  LoginViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 26/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

protocol LoginViewModel {
    var username: String { get }
    var password: String { get }
    var name: String { get }
    var email: String { get }
    
    func validateUserData() -> Bool
    func saveUserData(user: User)
    func getActiveUserData()
}
