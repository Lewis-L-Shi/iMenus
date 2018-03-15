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
    var dishArrayforSwipe:[Dish]!
    var dishIndex:NSInteger!
    var maximages:Int!
    var urlStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Up Url
        urlStr = setupURL(name: dishDataReceived.dish_name)
        //Set Tap Gesture for Image
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(DishViewController.imageTapped(gesture:)))
        dishImage.addGestureRecognizer(imageTapGesture)
        dishImage.isUserInteractionEnabled = true
        //Set Up Font and Tab Gesture for name Label
        let underlineAttribute = [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue]
        let underlineAttributedString = NSAttributedString(string: dishDataReceived.dish_name, attributes: underlineAttribute)
        dishName.attributedText = underlineAttributedString
        let labelTapGesture = UITapGestureRecognizer(target: self, action: #selector(DishViewController.labelTapped(gesture:)))
        dishName.addGestureRecognizer(labelTapGesture)
        dishName.isUserInteractionEnabled = true
        dishName.textColor = UIColor.blue
        
        maximages=dishArrayforSwipe.count-1
        dishImage.image=dishDataReceived.dish_photo
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
        var count=0;
        for dish in dishArrayforSwipe
        {
            if dish.dish_name==dishDataReceived.dish_name
            {
                dishIndex=count
                break
            }
            count=count+1
        }
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped)) // put : at the end of method name
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    func onUserAction(data: Int)
    {
        changedRating=Double(data)
        let user_id=UserDefaults.standard.integer(forKey: "user_id")
        //change dishname to id while storing
        let currentDishUserRating=UDRReferenceDataHelper.getRating(uuser_id: Int64(user_id), ddish_id: dishArrayforSwipe[dishIndex].dish_id)
        let currentDishRating=dishArrayforSwipe[dishIndex].dish_rating!
        if (!currentDishUserRating.isEmpty)
        {
            //update rating to in udrreference table
            UDRReferenceDataHelper.updateRating(uuser_id: Int64(user_id), ddish_Id: dishArrayforSwipe[dishIndex].dish_id, newRating: changedRating)
        }else
        {
            UDRReferenceDataHelper.addRating(uuser_id: Int64(user_id), ddish_id: dishArrayforSwipe[dishIndex].dish_id, rrating: changedRating)
        }
        var newAvgRating:Double
        newAvgRating=(Double(Int64((currentDishRating * Double(dishArrayforSwipe[dishIndex].num_of_ratings!))+changedRating)/(dishArrayforSwipe[dishIndex].num_of_ratings!+1)))
        DishDataHelper.updateDishRating(ddish_Id: dishArrayforSwipe[dishIndex].dish_id, newRating: newAvgRating, newNoOfRatings: (dishArrayforSwipe[dishIndex].num_of_ratings!+1))
        
    }
    
    @objc func labelTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UILabel) != nil {
            if let imageUrl = URL(string: urlStr) {
                UIApplication.shared.open(imageUrl)
            }
        }
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            if let imageUrl = URL(string: urlStr+"&tbm=isch") {
                UIApplication.shared.open(imageUrl)
            }
        }
    }
    
    private func setupURL(name: String) -> String {
        var resUrl = "http://www.google.com/search?q="
        let tokenArr = name.components(separatedBy: " ")
        for item in tokenArr {
            resUrl.append(item)
            resUrl.append("+")
        }
        resUrl.removeLast()
        return resUrl
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                // decrease index first
                
                dishIndex = dishIndex-1
                
                // check if index is in range
                
                if dishIndex < 0 {
                    
                    dishIndex = maximages
                }
                dishImage.image=dishArrayforSwipe[dishIndex].dish_photo
                dishName.text=dishArrayforSwipe[dishIndex].dish_name
                dishDescription.text=dishArrayforSwipe[dishIndex].dish_description
                self.title=dishArrayforSwipe[dishIndex].dish_name
                ratingControl.dishViewController=self
                if(dishArrayforSwipe[dishIndex].dish_rating==nil)
                {
                    previousRating=0
                    ratingControl.rating=0
                }else{
                    previousRating=Int(dishArrayforSwipe[dishIndex].dish_rating!)
                    ratingControl.rating=(Int(dishArrayforSwipe[dishIndex].dish_rating!))
                }
                
                ratingControl.isHidden=true
                var username:String?
                username=UserDefaults.standard.string(forKey: "username")
                if(username != nil)
                {
                    let user_id=UserDefaults.standard.integer(forKey: "user_id")
                    let dishUserRatings=UDRReferenceDataHelper.getRating(uuser_id: Int64(user_id), ddish_id: dishArrayforSwipe[dishIndex].dish_id)
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
                
            case UISwipeGestureRecognizerDirection.left:
                
                // increase index first
                
                dishIndex = dishIndex+1
                
                // check if index is in range
                
                if dishIndex > maximages {
                    
                    dishIndex = 0
                }
                
                //set next dish here
                //imageView.image = UIImage(named: imageList[imageIndex])
                dishImage.image=dishArrayforSwipe[dishIndex].dish_photo
                dishName.text=dishArrayforSwipe[dishIndex].dish_name
                dishDescription.text=dishArrayforSwipe[dishIndex].dish_description
                self.title=dishArrayforSwipe[dishIndex].dish_name
                ratingControl.dishViewController=self
                if(dishArrayforSwipe[dishIndex].dish_rating==nil)
                {
                    previousRating=0
                    ratingControl.rating=0
                }else{
                    previousRating=Int(dishArrayforSwipe[dishIndex].dish_rating!)
                    ratingControl.rating=(Int(dishArrayforSwipe[dishIndex].dish_rating!))
                }
                
                ratingControl.isHidden=true
                var username:String?
                username=UserDefaults.standard.string(forKey: "username")
                if(username != nil)
                {
                    let user_id=UserDefaults.standard.integer(forKey: "user_id")
                    let dishUserRatings=UDRReferenceDataHelper.getRating(uuser_id: Int64(user_id), ddish_id: dishArrayforSwipe[dishIndex].dish_id)
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
                
                
                
            default:
                break //stops the code/codes nothing.
            }
        }
    }
}

    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */


