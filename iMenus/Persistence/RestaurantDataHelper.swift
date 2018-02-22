//
//  RestaurantDataHelper.swift
//  iMenus
//
//  Created by Yishi Liu on 2/21/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import Foundation
import SQLite
import UIKit

extension UIImage: Value {
    public class var declaredDatatype: String {
        return Blob.declaredDatatype
    }
    public class func fromDatatypeValue(_ blobValue: Blob) -> UIImage {
        return UIImage(data: Data.fromDatatypeValue(blobValue))!
    }
    public var datatypeValue: Blob {
        return UIImagePNGRepresentation(self)!.datatypeValue
    }
    
}

class RestaurantDataHelper {
    static let TABLE_NAME = "Restaurants"
    static let myDB = iMenusDatabase.instance.db
    static let restaurants = Table(TABLE_NAME)
    static let restaurant_id = Expression<Int64>("restaurant_id")
    static let restaurant_name = Expression<String>("restaurant_name")
    static let restaurant_description = Expression<String>("restaurant_description")
    static let restaurant_contact_info = Expression<String>("restaurant_contact_info")
    static let restaurant_logo = Expression<UIImage>("restaurant_logo")
    
    static func getAllRestaurants() -> [Restaurant] {
        var result = [Restaurant]()
        do{
            for res in try myDB.prepare(restaurants) {
                result.append(Restaurant(restaurant_id: res[restaurant_id], restaurant_name: res[restaurant_name], restaurant_description: res[restaurant_description], restaurant_contact_info: res[restaurant_contact_info], restaurant_logo: res[restaurant_logo]))
            }
        }catch { print("Error getting Restaurants.") }
        return result
    }
}
