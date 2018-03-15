//
//  ViewController.swift
//  iMenus
//
//  Created by Yishi Liu on 1/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        // Do any additional setup after loading the view, typically from a nib.
        
        logoutButton.isHidden = true
        loginButton.isHidden = false
        let uName = UserDefaults.standard.value(forKey: "username") as? String
        if(uName != nil) {
            loginButton.isHidden = true
            logoutButton.isHidden = false
            welcomeLabel.text = "Welcome \(uName ?? "Guest")!"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutClicked(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "user_id")
    }
}

