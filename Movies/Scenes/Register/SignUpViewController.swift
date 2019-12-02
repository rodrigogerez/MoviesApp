//
//  SignUpViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 27/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import  UIKit

class SignUpViewController: BaseViewController {
    
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextField2: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var errorlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // Set up all visual improvements
    func setupUI() {
        registerButton.layer.cornerRadius = 20
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        goBackWithAnimation()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        errorlabel.isHidden = true
        
        if let username = usernameTextField.text,
           let password = passwordTextField.text,
           let name = nameTextField.text,
           let email = emailTextField.text,
           let password2 = passwordTextField2.text,
            username != "", password != "", name != "", email != "", password2 != "" {
            
            if password != password2 {
                setErrorMessage(errorLabel: errorlabel, errorText: K.AuthConstants.passwordDoesNotMatchErrorMessage)
                return
            }
            
            let signUpVM = SignUpViewModel(username: username, password: password, name: name, email: email)
            if signUpVM.saveUserData() {
                goBackWithAnimation()
            } else {
                setErrorMessage(errorLabel: errorlabel, errorText: K.AuthConstants.registerErrorMessage)
            }
            
        } else {
            setErrorMessage(errorLabel: errorlabel, errorText: K.AuthConstants.fieldEmptyErrorMessage)
        }
    }
}
