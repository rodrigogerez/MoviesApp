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
    
    func loginUser() -> Result<(), AuthError>
    func getActiveUserData()
}

// MARK: LoginViewModel
class LoginViewModel: LoginViewModelProtocol {
        
    // LoginViewModel protocol properties
    var username: String
    var password: String
    
    // Protocol functions
    func loginUser() -> Result<(), AuthError> {
        
        let result = AuthService.loginWithResult(username: username, password: password)
        switch result {
            case .success():
                return .success(())
            case .failure(let error):
                return .failure(error)
        }
    }
    
    func getActiveUserData() {
        
    }
    
    // Init
    init(_ username: String, _ password: String) {
        self.username = username
        self.password = password
    }
    
}
