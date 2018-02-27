//
//  RDReferenceDataHelper.swift
//  iMenus
//
//  Created by Yishi Liu on 2/21/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import SQLite

class RDReferenceDataHelper {
    static let TABLE_NAME = "RestaurantDishReference"
    static let myDB = iMenusDatabase.instance.db
    static let ref = Table(TABLE_NAME)
    static let restaurant_id = Expression<Int64>("restaurant_id")
    static let dish_id = Expression<Int64>("dish_id")
    
    static func getDishIds(restr_id: Int64) -> [Int64] {
        var result = [Int64]()
        let query = ref.select(dish_id).filter(restaurant_id == restr_id)
        do{
            for res in try myDB.prepare(query) {
                result.append(res[dish_id])
            }
        }catch {print("Dish id query failed.")}
        return result
    }
    
    static func getRestaurantIdsByDishName(name: String) -> [Int64] {
        var result = [Int64]()
        let dish = DishDataHelper.getDishIdByName(name: name)
        let query = ref.select(restaurant_id).filter(dish_id == dish)
        do{
            for res in try myDB.prepare(query) {
                result.append(res[restaurant_id])
            }
        }catch { print("Could not get restaurant ids by dish name.") }
        return result
    }
}
