//
//  Dish.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/5/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class Dish {
    var dishName: String
    var dishPhoto: UIImage?
    var dishDescription: String
    init?(dishName: String, dishPhoto: UIImage?, dishDescription: String) {
        if dishName.isEmpty {
            return nil
        }
        self.dishName = dishName
        self.dishPhoto = dishPhoto
        self.dishDescription=dishDescription
        
    }
    
}
