//
//  Restaurant.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/1/18.
//

import UIKit

class Restaurant {
    var restaurant_id: Int64
    var restaurant_name: String
    var restaurant_logo: UIImage
    var restaurant_description: String
    var restaurant_contact_info: String
    
    init(restaurant_id: Int64, restaurant_name: String, restaurant_description: String, restaurant_contact_info: String, restaurant_logo: UIImage) {
        self.restaurant_id = restaurant_id
        self.restaurant_name = restaurant_name
        self.restaurant_description = restaurant_description
        self.restaurant_contact_info = restaurant_contact_info
        self.restaurant_logo = restaurant_logo
    }
}
