//
//  LoginViewModel.swift
//  Movies
//
//  Created by Rodrigo Gerez on 26/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation

// MARK: LoginViewModelProtocol
protocol LoginViewModelProtocol {
    var username: String { get }
    var password: String { get }
    
    func LoginUser() throws
    func getActiveUserData()
}

// MARK: LoginViewModel
class LoginViewModel: LoginViewModelProtocol {
        
    // LoginViewModel protocol properties
    var username: String
    var password: String
    
    let authService: AuthService
    
    // Protocol functions
    func LoginUser() throws {
        do {
            _ = try authService.loginWithResult(username: username, password: password).get()
        } catch {
            throw error
        }
    }
    
    func getActiveUserData() {
        
    }
    
    // Init
    init(_ username: String, _ password: String) {
        self.username = username
        self.password = password
        
        authService = AuthService()
    }
    
}
