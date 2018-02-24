//
//  UserDataHelper.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/22/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import SQLite
import UIKit

class UserDataHelper {
    static let TABLE_NAME = "Users"
    static let myDB = iMenusDatabase.instance.db
    static let users = Table(TABLE_NAME)
    static let user_id = Expression<Int64>("user_id")
    static let username = Expression<String>("username")
    static let email = Expression<String>("email")
    static let password = Expression<String>("password")
    static func addUser(uuser_id:Int64,uusername: String, uemailId: String, upassword: String) -> Int64? {
        do {
            print("in do")
            let insert = users.insert(user_id<-uuser_id,username <- uusername, email <- uemailId, password <- upassword)
           // let insert = users.insert(username <- username, emailId <- emailId, password <- password)
            let id = try myDB.run(insert)
            print("after insert")
            return id
        } catch  {
            
            //print(err)
            return -1
        }
    }
    static func getUser(uusername:String) -> [User] {
        let  user=users.filter(username==uusername)
        var foundUsers = [User]()
        
        do {
            for uuser in try myDB.prepare(user) {
                foundUsers.append(User(
                    user_id: uuser[user_id],
                    username: uuser[username],
                    emailId: uuser[email],
                    password: uuser[password])!)
            }
        } catch {
            print("Select failed")
        }
       return foundUsers
        
    }
    
   static func getUsers() -> [User] {
        var users = [User]()
    
        do {
            for uuser in try myDB.prepare(self.users) {
                users.append(User(
                    user_id: uuser[user_id],
                    username: uuser[username],
                    emailId: uuser[email],
                    password: uuser[password])!)
            }
        } catch {
            print("Select failed")
        }
    
        return users
    }

}
