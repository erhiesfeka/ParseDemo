//
//  LoginViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/28/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit

import Parse

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextFeild: UITextField!
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    @IBAction func loginAction(sender: AnyObject) {
        var username = self.usernameTextFeild.text
        var password = self.passwordTextFeild.text
        
        var user = PFUser()
        
        user.username = username
        user.password = password
        
     
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UIViewController
        presentViewController(viewController, animated: true, completion: nil)
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
