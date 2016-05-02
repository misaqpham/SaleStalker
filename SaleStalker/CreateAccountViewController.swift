//
//  CreateAccountViewController.swift
//  SaleStalker
//
//  Created by Misa Pham on 2/22/16.
//  Copyright © 2016 Misa Pham. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func signupErrorAlert(title: String, message: String) {
    
        // Called upon signup error to let the user know signup didn't work.
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func createAccount(sender: AnyObject) {
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let email = emailTextField.text
        let password = passwordTextField.text
        let confirmPassword = confirmPasswordTextField.text
        
        if firstName != "" &&  lastName != "" && email != "" && password != "" && confirmPassword != "" {
            
            // Set Email and Password for the New User.
            
            DataService.dataService.BASE_REF.createUser(email, password: password, withValueCompletionBlock: { error, result in
                
                if error != nil {
                    
                    // There was a problem.
                    self.signupErrorAlert("Oops!", message: "It appears you already have an account associated with that email.")
                    
                } else {
                    
                    // Create and Login the New User with authUser
                    DataService.dataService.BASE_REF.authUser(email, password: password, withCompletionBlock: {
                        err, authData in
                        
                        let user = ["provider": authData.provider!, "email": email!, "firstName": firstName!, "lastName": lastName!]
                        
                        // Seal the deal in DataService.swift.
                        DataService.dataService.createNewAccount(authData.uid, user: user)
                    })
                    
                    // Store the uid for future access - handy!
                    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
                    
                    // Enter the app.
                    self.performSegueWithIdentifier("NewUserLoggedIn", sender: nil)
                }
            })
            
        } else {
            signupErrorAlert("Oops!", message: "Don't forget to enter your email, password, and name.")
        }
        
    }
    
    @IBAction func cancelCreateAccount(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: {})

    }
    
}