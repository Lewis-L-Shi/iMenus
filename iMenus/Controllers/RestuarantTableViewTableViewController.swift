//
//  RestuarantTableViewTableViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 1/23/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit
import SQLite
import CoreLocation

class RestuarantTableViewTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    var restaurants = RestaurantDataHelper.getAllRestaurants()
    var valueToPass:Restaurant!
    var filteredRestaurants=[Restaurant]()
    var dishNames = DishDataHelper.getAllDishNames()
    var sortedByDist = false
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search for Restaurants"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        if #available(iOS 11.0, *) {
            // For iOS 11 and later, we place the search bar in the navigation bar.
            navigationController?.navigationBar.prefersLargeTitles = false
            
            navigationItem.searchController = searchController
            
            // We want the search bar visible all the time.
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // For iOS 10 and earlier, we place the search bar in the table view's header.
            tableView.tableHeaderView = searchController.searchBar
        }
        
        if let lat = UserDefaults.standard.value(forKey: "myCurrentLat") as? CLLocationDegrees {
            let long = UserDefaults.standard.value(forKey: "myCurrentLong") as! CLLocationDegrees
            restaurants = sortRestaurantsByDist(lat: lat, long: long)
        }
    }
    
    private func searchDisplayController(controller: UISearchController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchText: searchString)
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
        
    }
    func filterContentForSearchText(searchText: String) {
        filteredRestaurants = restaurants.filter({( restaurant: Restaurant) -> Bool in
             restaurant.restaurant_name.lowercased().contains(searchText.lowercased())
        })
        if(filteredRestaurants.count == 0) {
            let dish = searchText.lowercased()
            if(dishNames.contains(dish)){
                filteredRestaurants = RestaurantDataHelper.getRestaurantsByDishName(name: dish.capitalized)
            }
        }
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredRestaurants.count
        }
        return restaurants.count
    }

    func isFiltering() -> Bool {
        //return ((self.searchDisplayController?.isActive)! && searchBarIsEmpty())
        return searchController.isActive && !searchBarIsEmpty()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RestuarantsTableCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RestuarantsTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RestaurantTableViewCell.")
        }
        let restaurant:Restaurant
        if isFiltering() {
            restaurant = filteredRestaurants[indexPath.row]
        } else {
            restaurant=restaurants[indexPath.row]
        }
        cell.def.image = restaurant.restaurant_logo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to the second view controller
        let indexPath = tableView.indexPathForSelectedRow!
        let restaurant:Restaurant
        if isFiltering() {
            restaurant = filteredRestaurants[indexPath.row]
        } else {
            restaurant=restaurants[indexPath.row]
        }
        valueToPass = restaurant
        self.performSegue(withIdentifier: "RestViewSegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        let resController = segue.destination as! RestaurantController
        // set a variable in the second view controller with the data to pass
        resController.passedRes=valueToPass
    }
    
    private func sortRestaurantsByDist(lat: CLLocationDegrees, long: CLLocationDegrees) -> [Restaurant] {
        var restrs = [Restaurant]()
        var distances = [Double]()
        let myCoords = CLLocation(latitude: lat, longitude: long)
        for item in restaurants {
            let coords = CLLocation(latitude: item.restaurant_lat, longitude: item.restaurant_long)
            distances.append(myCoords.distance(from: coords))
            restrs.append(item)
        }
        let combined = zip(distances, restrs).sorted(by: {$0.0 < $1.0})
        let result = combined.map({$0.1})
        return result
    }
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        self.performSegue(withIdentifier: "loginView", sender: self)
    //    }
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
extension RestuarantTableViewTableViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}


