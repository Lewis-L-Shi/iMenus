//
//  DishViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/6/18.
//  Copyright © 2018 UWB. All rights reserved.
//

//
//  DishViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/6/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit

class DishViewController: UIViewController {
    
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDescription: UILabel!
    @IBOutlet weak var ratingControl: RatingController!
    var dishDataReceived: Dish!
    var changedRating:Double!
    var previousRating:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dishImage.image=dishDataReceived.dish_photo
        dishName.text=dishDataReceived.dish_name
        dishDescription.text=dishDataReceived.dish_description
        self.title=dishDataReceived.dish_name
        ratingControl.dishViewController=self
        if(dishDataReceived.dish_rating==nil)
        {
            previousRating=0
            ratingControl.rating=0
        }else{
            previousRating=Int(dishDataReceived.dish_rating!)
            ratingControl.rating=(Int(dishDataReceived.dish_rating!))
        }
        
        ratingControl.isHidden=true
        var username:String?
        username=UserDefaults.standard.string(forKey: "username")
        if(username != nil)
        {
            let user_id=UserDefaults.standard.integer(forKey: "user_id")
            let dishUserRatings=UDRReferenceDataHelper.getRating(uuser_id: Int64(user_id), ddish_id: dishDataReceived.dish_id)
            ratingControl.isHidden = false
            if(!dishUserRatings.isEmpty)
            {
                ratingControl.rating=(Int(dishUserRatings[0]))
            }
            else
            {
                ratingControl.rating=0
            }
        } 
    }
    func onUserAction(data: Int)
    {
        changedRating=Double(data)
        let user_id=UserDefaults.standard.integer(forKey: "user_id")
        //change dishname to id while storing
        let currentDishUserRating=UDRReferenceDataHelper.getRating(uuser_id: Int64(user_id), ddish_id: dishDataReceived.dish_id)
        let currentDishRating=dishDataReceived.dish_rating!
        if (!currentDishUserRating.isEmpty)
        {
            //update rating to in udrreference table
            UDRReferenceDataHelper.updateRating(uuser_id: Int64(user_id), ddish_Id: dishDataReceived.dish_id, newRating: changedRating)
        }else
        {
            UDRReferenceDataHelper.addRating(uuser_id: Int64(user_id), ddish_id: dishDataReceived.dish_id, rrating: changedRating)
        }
        var newAvgRating:Double
        newAvgRating=(Double(Int64((currentDishRating * Double(dishDataReceived.num_of_ratings!))+changedRating)/(dishDataReceived.num_of_ratings!+1)))
        DishDataHelper.updateDishRating(ddish_Id: dishDataReceived.dish_id, newRating: newAvgRating, newNoOfRatings: (dishDataReceived.num_of_ratings!+1))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

