//
//  AuthService.swift
//  Movies
//
//  Created by Rodrigo Gerez on 27/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation
import RealmSwift

protocol AuthServiceProtocol {
    
    func loginWithResult(username: String, password: String) -> Result<Bool, AuthError>
    func register(user: User) throws
}

enum AuthError: Error {
    case NotExistentUser
    case PasswordDoesNotMatch
}

class AuthService: AuthServiceProtocol {
    
    func loginWithResult(username: String, password: String) -> Result<Bool, AuthError> {
        let user = try! Realm().object(ofType: User.self, forPrimaryKey: username)
        if let storedUser = user {
            if storedUser.password == password {
                return .success(true)
            } else {
                return .failure(.PasswordDoesNotMatch)
            }
        } else {
            return .failure(.NotExistentUser)
        }
    }
    
    func register(user: User) throws {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
            
        } catch {
            throw error
        }
    }

}
