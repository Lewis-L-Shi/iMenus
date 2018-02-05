//
//  Restaurants.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/1/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class Restaurants {
    var name: String
    var photo: UIImage?
    init?(name: String, photo: UIImage?) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.photo = photo
        
        
    }

}
