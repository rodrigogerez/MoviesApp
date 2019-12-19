//
//  ViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 25/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
   
    @IBOutlet weak var loginButtonView: UIButton!
    @IBOutlet weak var signUpButtonView: UIButton!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var loginVM: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    // Set up all visual improvements
    func setupUI() {
        loginButtonView.layer.cornerRadius = 20
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        errorLabel.isHidden = true
                
        if let username = usernameTextView.text, let password = passwordTextView.text, username != "", password != "" {
            
            loginVM = LoginViewModel(username, password)
                
            let result = loginVM.loginUser()
            switch result {
                case .success(()):
                    NavigationService.changeRoot(withIdentifier: "navController")
                case .failure(let error):
                    setErrorMessage(errorLabel: errorLabel, errorText: error.localizedDescription)
            }
        } else {
            setErrorMessage(errorLabel: errorLabel, errorText: K.AuthConstants.fieldEmptyErrorMessage)
            return
        }
    }
}

