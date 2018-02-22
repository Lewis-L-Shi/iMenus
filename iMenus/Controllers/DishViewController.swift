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
    var dishDataReceived: Dish!
    override func viewDidLoad() {
        super.viewDidLoad()
        dishImage.image=dishDataReceived.dish_photo
        dishName.text=dishDataReceived.dish_name
        dishDescription.text=dishDataReceived.dish_description
        self.title=dishDataReceived.dish_name
        
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
