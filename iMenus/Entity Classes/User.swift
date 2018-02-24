//
//  User.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/22/18.
//  Copyright © 2018 UWB. All rights reserved.
//

//
//  UserDetails.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/20/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import UIKit

class User{
    var user_id:Int64
    var username:String
    var emailId:String
    var password:String
    init?(user_id:Int64,username: String, emailId:String, password: String) {
        if username.isEmpty {
            return nil
        }
        self.user_id=user_id
        self.username = username
        self.emailId = emailId
        self.password=password
    }
//    required convenience init(coder aDecoder: NSCoder) {
//        let user_id = aDecoder.decodeObject(forKey: "user_id")as! Int64
//        let username = aDecoder.decodeObject(forKey: "username")as! String
//        let emailId = aDecoder.decodeObject(forKey: "emailId") as! String
//        let password = aDecoder.decodeObject(forKey: "password") as! String
//        self.init(user_id:user_id,username:username,emailId:emailId,password:password)!
//    }
//
//    func encode(with aCoder: NSCoder) {
//       aCoder.encode(user_id, forKey: "user_id")
//        aCoder.encode(username, forKey: "username")
//        aCoder.encode(emailId, forKey: "emailId")
//        aCoder.encode(password, forKey: "password")
//    }
    
}

