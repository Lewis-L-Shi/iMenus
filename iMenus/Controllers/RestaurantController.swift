//
//  RestaurantController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/2/18.
//  Copyright © 2018 UWB. All rights reserved.
//
import UIKit
class RestaurantController: UIViewController {
    
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var ContactInfo: UILabel!
    @IBOutlet weak var defImage: UIImageView!
    // This variable will hold the data being passed from the First View Controller
    var passedRes:Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.text = passedRes.restaurant_description
        ContactInfo.text = passedRes.restaurant_contact_info
        defImage.image = passedRes.restaurant_logo
        self.title = passedRes.restaurant_name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let data = passedRes
        let dest = segue.destination as! MealTableViewController
        dest.passedRes = data
    }
}

