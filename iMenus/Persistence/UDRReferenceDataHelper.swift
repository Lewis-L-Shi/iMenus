//
//  UDRReferenceDataHelper.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import SQLite

class UDRReferenceDataHelper {
    static let TABLE_NAME = "UserDishRatings"
    static let myDB = iMenusDatabase.instance.db
    static let udr = Table(TABLE_NAME)
    static let user_id = Expression<Int64>("user_id")
    static let dish_id = Expression<Int64>("dish_id")
    static let rating = Expression<Double>("rating")
    static func getRating(uuser_id:Int64,ddish_id:Int64) -> [Double] {
        var result = [Double]()
        
        let query = udr.select(rating).filter((user_id == uuser_id) && (dish_id==ddish_id))
        do{
            for res in try myDB.prepare(query) {
                result.append(res[rating])
            }
        }catch {
            print("Rating query failed.")
        }
        return result
    }
    static func addRating(uuser_id:Int64,ddish_id:Int64,rrating:Double) {
        do {
            let insert = udr.insert(user_id<-uuser_id,dish_id<-ddish_id,rating<-rrating)
            try myDB.run(insert)
            return
        } catch  {
            return
        }
    }
    
    static func updateRating(uuser_id:Int64,ddish_Id:Int64, newRating: Double) {
        let res = udr.filter((uuser_id==user_id) && (ddish_Id==dish_id))
        do {
            let update = res.update([
                rating<-newRating
                ])
            if try myDB.run(update) > 0 {
                return 
            }
        } catch {
            print("Update failed: \(error)")
        }
        return 
    }
}

