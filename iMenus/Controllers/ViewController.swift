//
//  ViewController.swift
//  iMenus
//
//  Created by Yishi Liu on 1/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit
import SQLite
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        copyDatabaseIfNeeded()
        
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        UserDefaults.standard.setValue(locValue.latitude, forKey: "myCurrentLat")
        UserDefaults.standard.setValue(locValue.longitude, forKey: "myCurrentLong")
    }
    
    @IBAction func logoutClicked(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "user_id")
    }
    
    func copyDatabaseIfNeeded() {
        // Move database file from bundle to documents folder
        
        let fileManager = FileManager.default
        
        guard let documentsUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let finalDatabaseURL = documentsUrl.appendingPathComponent("iMenusDB.db")
        
        do {
            if !fileManager.fileExists(atPath: finalDatabaseURL.path) {
                print("DB does not exist in documents folder")
                
                if let dbFilePath = Bundle.main.path(forResource: "iMenusDB", ofType: "db") {
                    try fileManager.copyItem(atPath: dbFilePath, toPath: finalDatabaseURL.path)
                } else {
                    print("Uh oh - iMenusDB.db is not in the app bundle")
                }
            } else {
                print("Database file found at path: \(finalDatabaseURL.path)")
            }
        } catch {
            print("Unable to copy iMenusDB.db: \(error)")
        }
    }


}

