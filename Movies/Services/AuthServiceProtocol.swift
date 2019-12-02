//
//  AuthServiceProtocol.swift
//  Movies
//
//  Created by Rodrigo Gerez on 27/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

protocol AuthServiceProtocol {
    
    func login(username: String, password: String) throws -> Bool
    func loginWithResult(username: String, password: String) -> Result<User, AuthError>
    func register(user: User)
}

enum AuthError: Error {
    let NotExistentUser
    let PasswordDoesNotMatch
}
