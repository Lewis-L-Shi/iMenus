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
    var restaurant_lat: Double
    var restaurant_long: Double
    
    init(restaurant_id: Int64, restaurant_name: String, restaurant_description: String, restaurant_contact_info: String, restaurant_logo: UIImage, restaurant_lat: Double, restaurant_long: Double) {
        self.restaurant_id = restaurant_id
        self.restaurant_name = restaurant_name
        self.restaurant_description = restaurant_description
        self.restaurant_contact_info = restaurant_contact_info
        self.restaurant_logo = restaurant_logo
        self.restaurant_lat = restaurant_lat
        self.restaurant_long = restaurant_long
    }
}
