//
//  iMenusDatabase.swift
//  iMenus
//
//  Created by Yishi Liu on 2/20/18.

import Foundation
import SQLite

class iMenusDatabase {
    static let instance = iMenusDatabase()
    let db: Connection
    
    private init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        db = try! Connection("\(path)/iMenusDB.db")
    }
}
