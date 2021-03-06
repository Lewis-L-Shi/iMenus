//
//  LoginViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/19/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var userDetailsToBePassed:User!
    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        //Query db server here for login info
        var foundUsers = [User]()
        foundUsers=UserDataHelper.getUser(uusername:username)
        if(username.isEmpty)
        {
            displayAlertMessage(userMessage: "All fields are required!")
            return
        }
        if(password.isEmpty)
        {
            displayAlertMessage(userMessage: "All fields are required!")
            return
        }
        if(!foundUsers.isEmpty)
        {   let decryptedpassword:String=AES256CBC.decryptString(foundUsers[0].password,password: foundUsers[0].salt)!
            if(password==decryptedpassword)
            {
                UserDefaults.standard.set(username,forKey: "username")
                UserDefaults.standard.set(foundUsers[0].user_id,forKey: "user_id")
                UserDefaults.standard.synchronize()
            }
            else{
                displayAlertMessage(userMessage: "Invalid Password")
                return
            }
        }
        else{
            displayAlertMessage(userMessage: "Invalid username! Please register or try again!")
            return
        }
        
    }
    func displayAlertMessage(userMessage: String)
    {
        let alertMsg = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default,handler:nil)
        alertMsg.addAction(okAction)
        self.present(alertMsg,animated: true, completion: nil)
    }

}
