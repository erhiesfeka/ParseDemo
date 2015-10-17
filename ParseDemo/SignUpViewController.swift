//
//  SignUpViewController.swift
//  ParseDemo
//
//  Created by Rumiya Murtazina on 7/30/15.
//  Copyright (c) 2015 abearablecode. All rights reserved.
//

import UIKit

import Parse


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailFeild: UITextField!
    @IBOutlet weak var usernameFeild: UITextField!
    @IBOutlet weak var passwordFeild: UITextField!
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        var username = self.usernameFeild.text
        var password = self.passwordFeild.text
        var email = self.emailFeild.text
        var finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        //var content = ""
        
        //Text feild validation
        
        
        if count(username)<5{
            authenticationAlert("Username", minChar: 5 )
            
        }else if count(password) < 8 {
            authenticationAlert("Password", minChar: 8)
            
        } else if count(email) < 8 {
            authenticationAlert("email", minChar: 8)
            
        }else{
            // Spinner to show task in progress
            
            var spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            var newUser = PFUser()
            
            newUser.username = username
            newUser.password = password
            newUser.email = finalEmail
            
            //sign up asynchronously
            
            newUser.signUpInBackgroundWithBlock({(succeed, error) -> Void in
                
                //stop the spinner
                spinner.stopAnimating()
                if ((error) != nil) {
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                } else {
                    var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UIViewController
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                }
            })
            
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func authenticationAlert(content:String, minChar:Int){
        
        var alert = UIAlertView(title: "Invalid", message: content + " should contain more than \(minChar) characters", delegate: self, cancelButtonTitle: "OK")
        alert.show()
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
