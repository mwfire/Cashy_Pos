//
//  UserLoginViewController.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/11/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit
import Firebase

class UserLoginViewController: UIViewController {
    
    //MARK: - Properties
    
    private var firebase = Firebase(url: "https://cashy-pos.firebaseio.com")
    
    let alert = Alerts()
    let login = "login"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        /// An observer in firebase that checks if the user is authorized.
        firebase.observeAuthEventWithBlock { (authData) -> Void in
            if authData != nil {
                self.performSegueWithIdentifier(self.login, sender: nil)
                self.passwordTextField.text = ""
            }
        }
    }
    
    @IBAction func loginActionButton(sender: UIButton) {
        guard emailTextField.text != "" else {
            let emailAlert = alert.showAlertFor(.Email)
            presentViewController(emailAlert, animated: true, completion: nil)
            
            return
        }
        
        guard passwordTextField.text != "" else {
            let passwordAlert = alert.showAlertFor(.Password)
            presentViewController(passwordAlert, animated: true, completion: nil)
            
            return
        }
        
        firebase.authUser(emailTextField.text, password: passwordTextField.text) { error, authData in
            if error != nil {
               let errorAlert = self.alert.showAlertFor(.ErrorLogin)
                self.presentViewController(errorAlert, animated: true, completion: nil)
            } else {
                self.resignFirstResponder()
                self.performSegueWithIdentifier(self.login, sender: nil)
            }
        }
    }
}

//MARK: - Protocol Conformance

extension UserLoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        /// Hides the keyboard
        passwordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        
        return true
    }
    
    /// This function dismisses the keyboard when user touches outside the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
