//
//  SecondViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/2/18.
//  Copyright © 2018 UWB. All rights reserved.
//
import UIKit
class SecondViewController: UIViewController {
    
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var ContactInfo: UILabel!
    @IBOutlet weak var defImage: UIImageView!
    // This variable will hold the data being passed from the First View Controller
    var passedRes:Restaurants!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Description.text = passedRes.resDescription
        ContactInfo.text = passedRes.contactInfo
        defImage.image = passedRes.photo
    }
}
