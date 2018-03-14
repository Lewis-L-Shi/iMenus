//
//  RegisterViewController.swift
//  iMenus
//
//  Created by Azra Bandukwala on 2/19/18.
//  Copyright © 2018 UWB. All rights reserved.
//

import UIKit
import CryptoSwift
class RegisterViewController: UIViewController {
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createAccountButtonTapped(_ sender: Any) {
        let emailId=emailTextField.text!
        let username=usernameTextField.text!
        let password=passwordTextField.text!
        let confirmPassword=confirmPasswordTextField.text!
        if(emailId.isEmpty)
        {
            displayAlertMessage(userMessage: "All fields are required!")
            return
        }
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
        if(confirmPassword.isEmpty)
        {
            displayAlertMessage(userMessage: "All fields are required!")
            return
        }
        //also add email validation code
       
        var isValidEmailAddress: Bool {
            let types: NSTextCheckingResult.CheckingType = [.link]
            let linkDetector = try? NSDataDetector(types: types.rawValue)
            let range = NSRange(location: 0, length: emailId.count)
            let result = linkDetector?.firstMatch(in: emailId, options: .reportCompletion, range: range)
            let scheme = result?.url?.scheme ?? ""
            return scheme == "mailto" && result?.range.length == emailId.count
        }
        if(isValidEmailAddress==false)
        {
            displayAlertMessage(userMessage: "Invalid emailId");
            return;
        }
        if (password != confirmPassword)
        {
            displayAlertMessage(userMessage: "Passwords do not match!");
            return;
        }
        //store user data in database. for now user defaults
        UserDataHelper.addUser(uusername: username, uemailId: emailId, upassword: password)
        //let user=UserDataHelper.getUser(uusername: username)
        UserDefaults.standard.set(emailId, forKey: "emailId")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
        //Store in userDetails object and map it to database
       //var newRegisteredUser=User(user_id:2,username:username,emailId:emailId,password:password)
        // display success message and redirectto login
        let successMsg = UIAlertController(title:"Alert",message:"Registeration Successful!",preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default){
            action in
            self.dismiss(animated: false,completion:nil)
        }
        successMsg.addAction(okAction)
        self.present(successMsg,animated:true,completion:nil)
    }
    func displayAlertMessage(userMessage: String)
    {
        let alertMsg = UIAlertController(title:"Alert",message:userMessage,preferredStyle:UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok",style:UIAlertActionStyle.default,handler:nil)
        alertMsg.addAction(okAction)
        self.present(alertMsg,animated: true, completion: nil)
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


