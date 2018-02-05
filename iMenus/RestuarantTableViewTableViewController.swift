//
//  RestuarantTableViewTableViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 1/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class RestuarantTableViewTableViewController: UITableViewController {
    var restaurants=[Restaurants]()
    var valueToPass:UIImage!
    var selectedRestaurant:Restaurants!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRestuarants()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    private func loadRestuarants()
    {
        let photo1 = UIImage(named: "rest1")
        let photo2 = UIImage(named: "rest2")
        let photo3 = UIImage(named: "rest3")
        guard let restaurant1 = Restaurants(name: "Saffron Grill", photo: photo1) else {
            fatalError("Unable to instantiate restuarant11")
        }
        
        guard let restuarant2 = Restaurants(name: "BaiTong", photo: photo2) else {
            fatalError("Unable to instantiate restaurant2")
        }
        
        guard let restuarant3 = Restaurants(name: "Altura", photo: photo3) else {
            fatalError("Unable to instantiate restaurant3")
        }
        restaurants+=[restaurant1,restuarant2,restuarant3]
        
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RestuarantsTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestuarantsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RestaurantTableViewCell.")
        }
         let restaurant=restaurants[indexPath.row]
        cell.def.image = restaurant.photo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as! RestuarantsTableViewCell
        selectedRestaurant=restaurants[indexPath.row]
        valueToPass = currentCell.def.image
        self.performSegue(withIdentifier: "RestViewSegue", sender: self)
        
        
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! SecondViewController
        
        // set a variable in the second view controller with the data to pass
        secondViewController.receivedData1=valueToPass
        secondViewController.receivedData2=selectedRestaurant.name
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
