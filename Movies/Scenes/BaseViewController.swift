//
//  BaseViewController.swift
//  Movies
//
//  Created by Rodrigo Gerez on 02/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func setErrorMessage(errorLabel: UILabel, errorText: String) {
        errorLabel.text = errorText
        errorLabel.isHidden = false
    }
    
    func goBackWithAnimation() {
        dismiss(animated: true, completion: nil)
    }
    
}
