//
//  LoginViewModelFromUser.swift
//  Movies
//
//  Created by Rodrigo Gerez on 26/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

class LoginViewModelFromUser: LoginViewModel {
    
    var user: User
    
    // LoginViewModel protocol properties
    var username: String
    var password: String
    var name: String
    var email: String
    
    let authService: AuthService
    
    // Protocol functions
    func validateUserData() -> Bool {
        do {
            return try authService.login(username: user.username!, password: user.password!)
        } catch {
            return false
        }
        
    }
    
    func saveUserData(user: User) {
        print(user.name ?? "Something is WRONG!!!!")
        
        authService.register(user: user)
    }
    
    func getActiveUserData() {
        
    }
    
    // Init
    init(withUser user: User) {
        self.user = user
        
        self.username = user.username!
        self.password = user.password!
        self.name = user.name ?? ""
        self.email = user.email ?? ""
        
        authService = AuthService()
    }
    
}
