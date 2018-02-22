//
//  Dish.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/5/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class Dish {
    var dish_id: Int64
    var dish_name: String
    var dish_description: String
    var dish_photo: UIImage
    var dish_category: String?
    var dish_rating: Double?
    var num_of_ratings: Int64?
    
    init(dish_id: Int64, dish_name: String, dish_description: String, dish_photo: UIImage, dish_category: String?, dish_rating: Double?, num_of_ratings: Int64?) {
        self.dish_id = dish_id
        self.dish_name = dish_name
        self.dish_description = dish_description
        self.dish_photo = dish_photo
        self.dish_category = dish_category
        self.dish_rating = dish_rating
        self.num_of_ratings = num_of_ratings
    }
    
}
