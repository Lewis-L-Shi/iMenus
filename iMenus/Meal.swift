//
//  Meal.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/5/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class Meal {
    var dishId:integer_t
    var dishName: String
    var dishPhoto: UIImage?
    var dishDescription: String
    var dishIngredients: String
    var dishKeyFlavours: String
    init?(dishId: integer_t, dishName: String, dishPhoto: UIImage?, dishDescription: String,dishIngredients:String, dishKeyFlavours: String ) {
        if dishName.isEmpty {
            return nil
        }
        self.dishId=dishId
        self.dishName = dishName
        self.dishPhoto = dishPhoto
        self.dishDescription=dishDescription
        self.dishIngredients=dishIngredients
        self.dishKeyFlavours=dishKeyFlavours
        
    }
    
}
