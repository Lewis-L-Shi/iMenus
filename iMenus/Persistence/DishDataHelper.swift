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
}
