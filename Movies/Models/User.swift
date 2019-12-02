//
//  User.swift
//  Movies
//
//  Created by Rodrigo Gerez on 25/11/2019.
//  Copyright © 2019 Rodrigo Gerez. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var username: String?
    @objc dynamic var password: String?
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    
    override class func primaryKey() -> String? {
        return "username"
    }
}
