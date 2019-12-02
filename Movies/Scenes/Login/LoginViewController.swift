//
//  ViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 25/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let errorMessage = "Please, complete all the fields"
    let validateErrorMessage = "Invalid username/password"
   
    @IBOutlet weak var loginButtonView: UIButton!
    @IBOutlet weak var signUpButtonView: UIButton!
    @IBOutlet weak var usernameTextView: UITextField!
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
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
        
        let user = User()
        user.username = usernameTextView.text ?? ""
        user.password = passwordTextView.text ?? ""
        
        if user.username == "" || user.password == "" {
            setErrorMessage(errorText: errorMessage)
            return
        }
        
        let loginVM = LoginViewModelFromUser(withUser: user)
        
        if loginVM.validateUserData() {
            performSegue(withIdentifier: "GoToHome", sender: self)
        } else {
            setErrorMessage(errorText: validateErrorMessage)
        }
    }
    
    func setErrorMessage(errorText: String) {
        errorLabel.text = errorText
        errorLabel.isHidden = false
    }
}

