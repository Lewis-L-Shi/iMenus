//
//  SecondViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/2/18.
//  Copyright © 2018 UWB. All rights reserved.
//
import UIKit
class SecondViewController: UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var defImage: UIImageView!
    // This variable will hold the data being passed from the First View Controller
    var receivedData1:UIImage!
    var receivedData2:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text=receivedData2
        defImage.image=receivedData1
    }
}
