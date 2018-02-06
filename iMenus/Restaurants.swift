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
    var resDescription: String
    var contactInfo: String
    init?(name: String, photo: UIImage?, resDescription: String, contactInfo: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.photo = photo
        self.resDescription = resDescription
        self.contactInfo = contactInfo
    }

}
