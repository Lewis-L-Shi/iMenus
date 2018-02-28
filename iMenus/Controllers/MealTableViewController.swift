//
//  MealTableViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/5/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var passedRes: Restaurant!
    var valueToPass: Dish!
    var Menu: [Dish]!
    var sections=["Appetizer", "MainCourse", "Soup", "Dessert"]
    var appetizer_dish=[Dish]()
    var mainCourse_dish=[Dish]()
    var soup_dish=[Dish]()
    var dessert=[Dish]()
    var sectionData:[[Dish]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // sections=["Appetizer", "MainCourse", "Soup", "Dessert"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Menu = DishDataHelper.getDishes(restr_id: passedRes.restaurant_id)
        for dish in Menu
        {
            if(dish.dish_category=="Appetizer")
            {
                appetizer_dish.append(dish)
            }
            else if(dish.dish_category=="MainCourse")
            {
                mainCourse_dish.append(dish)
            }
            else if(dish.dish_category=="Soup")
            {
                soup_dish.append(dish)
            }
            else if(dish.dish_category=="Dessert")
            {
                dessert.append(dish)
            }
//            switch dish.dish_category{
//            case "Appetizer"?:
//                appetizer_dish.append(dish)
//            case "MainCourse"?:
//                mainCourse_dish.append(dish)
//            case "Soup"?:
//                soup_dish.append(dish)
//            case "Dessert"?:
//                dessert.append(dish)
            
     //       }
            
        }
        sectionData=[appetizer_dish,mainCourse_dish, soup_dish,dessert]
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (sectionData[section].count)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if(sectionData[section].count==0){
            return nil
        }
        return sections[section]
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath)  as? MealTableViewCell else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
      
        let dish = sectionData[indexPath.section][indexPath.row]
        cell.dishName.text = dish.dish_name
        cell.dishPhoto.image = dish.dish_photo
        if(dish.dish_rating==nil)
        {
            cell.ratingControl.rating=0
        }
        else{
            cell.ratingControl.rating=Int(dish.dish_rating!)
        }
        cell.ratingControl.setUnEditable()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Segue to the second view controller
        let indexPath = tableView.indexPathForSelectedRow!
        valueToPass = sectionData[indexPath.section][indexPath.row]
        self.performSegue(withIdentifier: "dishViewSegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let dishController = segue.destination as! DishViewController
        
        // set a variable in the second view controller with the data to pass
        dishController.dishDataReceived=valueToPass
        
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

