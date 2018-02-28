//
//  DishDataHelper.swift
//  iMenus
//
//  Created by Yishi Liu on 2/21/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import SQLite
import UIKit

class DishDataHelper {
    static let TABLE_NAME = "Dishes"
    static let myDB = iMenusDatabase.instance.db
    static let dishes = Table(TABLE_NAME)
    static let dish_id = Expression<Int64>("dish_id")
    static let dish_name = Expression<String>("dish_name")
    static let dish_description = Expression<String>("dish_description")
    static let dish_photo = Expression<UIImage>("dish_photo")
    static let dish_category = Expression<String?>("dish_category")
    static let dish_rating = Expression<Double?>("dish_rating")
    static let num_of_ratings = Expression<Int64?>("num_of_ratings")
    
    static func getDishes(restr_id: Int64) -> [Dish] {
        var result = [Dish]()
        let ids = RDReferenceDataHelper.getDishIds(restr_id: restr_id)
        let query = dishes.filter(ids.contains(dish_id))
        do {
            for res in try myDB.prepare(query) {
                result.append(Dish(dish_id: res[dish_id], dish_name: res[dish_name], dish_description: res[dish_description], dish_photo: res[dish_photo], dish_category: res[dish_category], dish_rating: res[dish_rating], num_of_ratings: res[num_of_ratings]))
            }
        }catch{ print("Error fetching dishes from DB.") }
        return result
    }
    
    static func getAllDishNames() -> [String] {
        var result = [String]()
        do{
            for res in try myDB.prepare(dishes) {
                result.append(res[dish_name].lowercased())
            }
        }catch { print("Error getting all restaurants.") }
        return result
    }
    
    static func getDishIdByName(name: String) -> Int64 {
        var result: Int64
        result = -1
        let query = dishes.filter(dish_name == name)
        do{
            if let res = try myDB.pluck(query){ result = res[dish_id] }
        }catch{ print("Error retrieving Dish ID by name.") }
        return result
    }
    
    static func updateDishRating(ddish_Id:Int64, newRating: Double, newNoOfRatings:Int64) {
        let res = dishes.filter(dish_id==ddish_Id)
        do {
            let update = res.update([
                dish_rating<-newRating,
                num_of_ratings<-newNoOfRatings
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
