//
//  SignUpViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 02/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

// MARK: SignUpViewModelProtocol
protocol SignUpViewModelProtocol {
    var user: User { get }
    
    func saveUserData() -> Bool
}

// MARK: SignUpViewModel
class SignUpViewModel: SignUpViewModelProtocol {
    var user: User
    
    let authService: AuthService
    
    func saveUserData() -> Bool {
        do {
            try authService.register(user: user)
            
            return true
        } catch {
            return false
        }
        
    }
    
    // Init
    init(username: String, password: String, name: String, email: String) {
        self.user = User()
        
        self.user.username = username
        self.user.password = password
        self.user.name = name
        self.user.email = email
        
        authService = AuthService()
    }
}
