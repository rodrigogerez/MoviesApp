//
//  AuthService.swift
//  Movies
//
//  Created by Rodrigo Gerez on 27/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation
import RealmSwift

class AuthService: AuthServiceProtocol {
    
    func login(username: String, password: String) throws -> Bool {

        //let user = try Realm().object(ofType: User.self, forPrimaryKey: username)
        print(username ?? "THIS IS WRONG!!!!")
        
        //return user != nil
        return true
    }
    
    func loginWithResult(username: String, password: String) -> Result<User, AuthError> {
        
        return 
    }
    
    
    func register(user: User) {
        let realm = try! Realm()
        realm.add(user)
        
        print(user.name ?? "THIS IS ALSO WRONG!!!")
    }
}
