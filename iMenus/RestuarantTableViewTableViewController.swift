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
    var valueToPass:Restaurants!
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
        let desc1 = "Saffron Grill brings to the Northgate area an inventive fusion of Indian and Mediterranean cuisine served in an inviting atmosphere that encourages you to linger."
        let desc2 = "Traditional Chinese eatery with Taiwanese influences."
        let desc3 = "Bai Tong is the standard for authentic Thai food in the Seattle area."
        let desc4 = "Twice cooked pork is a Chinese dish that originates from the Sichuan region of China. The dish is prepared by first simmering pork belly steaks in in water with spices, e.g. slices of ginger, cloves, star anise, jujubes and salt. After refrigeration to firm the meat, it's cut into thin slices and then shallow fried with oil in a wok along with various vegetables. Cooking the pork twice over makes each slice incredibly tender and rich in taste. You can expect the dish to be full of salty and spicy flavors."
        let contact1 = "2132 N Northgate Way\nSeattle  WA, 98133\n(206) 417 0707"
        let contact2 = "6969 Coal Creek Pkwy SE\nNewcastle, WA 98059\n(425) 644-5546"
        let contact3 = "14804  NE 24th St.\nRedmond, WA 98052\n(425) 747-8424"
        guard let tcp = Dish(dishName: "Twice Cooked Pork", dishPhoto: #imageLiteral(resourceName: "TwiceCookedPork"), dishDescription: desc4)else {
            fatalError("Unable to instantiate restuarant11")
        }
        guard let restaurant1 = Restaurants(name: "Saffron Grill", photo: photo1, resDescription: desc1, contactInfo: contact1, Menu: [tcp]) else {
            fatalError("Unable to instantiate restuarant11")
        }
        guard let restuarant2 = Restaurants(name: "Yea's Wok", photo: photo2, resDescription: desc2, contactInfo: contact2, Menu: [tcp]) else {
            fatalError("Unable to instantiate restaurant2")
        }
        
        guard let restuarant3 = Restaurants(name: "Baitong", photo: photo3, resDescription: desc3, contactInfo: contact3, Menu: [tcp]) else {
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
        valueToPass = restaurants[indexPath.row]
        self.performSegue(withIdentifier: "RestViewSegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let resController = segue.destination as! RestaurantController
        
        // set a variable in the second view controller with the data to pass
        resController.passedRes=valueToPass
        
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
