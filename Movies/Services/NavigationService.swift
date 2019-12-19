//
//  NavigationService.swift
//  Movies
//
//  Created by Rodrigo Gerez on 02/12/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import UIKit

struct NavigationService {
    
    static func changeRoot (withIdentifier controllerIdentifier: String) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: controllerIdentifier)
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
}
