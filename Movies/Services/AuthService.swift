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
    
    func loginWithResult(username: String, password: String) -> Result<(), AuthError>
    func register(user: User) throws
}

enum AuthError: Error {
    case NotExistentUser
    case PasswordDoesNotMatch
    case ExistentUser
}

extension AuthError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NotExistentUser, .PasswordDoesNotMatch:
            return K.AuthConstants.validateErrorMessage
        case .ExistentUser:
            return K.AuthConstants.userAlreadyExistErrorMessage
        }
    }
}

struct AuthService: AuthServiceProtocol {
    
    func loginWithResult(username: String, password: String) -> Result<(), AuthError> {
        let user = try! Realm().object(ofType: User.self, forPrimaryKey: username)
        
        if let storedUser = user {
            if storedUser.password == password {
                return .success(())
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
            
            if let _ = realm.object(ofType: User.self, forPrimaryKey: user.username) {
                throw AuthError.ExistentUser
            }
            try realm.write {
                realm.add(user)
            }
            
        } catch {
            throw error
        }
    }

}
