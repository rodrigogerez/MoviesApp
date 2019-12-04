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
    
    func saveUserData() -> Result<(), AuthError>
}

// MARK: SignUpViewModel
class SignUpViewModel: SignUpViewModelProtocol {
    var user: User
    
    func saveUserData() -> Result<(), AuthError> {
        guard let _ = try? AuthService.register(user: user) else {
            return .failure(.ExistentUser)
        }
        
        return .success(())
    }
    
    // Init
    init(username: String, password: String, name: String, email: String) {
        self.user = User()
        
        self.user.username = username
        self.user.password = password
        self.user.name = name
        self.user.email = email
    }
}
