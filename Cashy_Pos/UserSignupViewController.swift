//
//  UswerSignupViewController.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/11/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

/*
import UIKit
import Firebase

class UserSignupViewController: UIViewController {
    
    //MARK: - Properties
    
    private var firebase = Firebase(url: "https://cashy-pos.firebaseio.com")
    
    let alert = Alerts()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    
    /// Dismisses the view ( closes the view )
    @IBAction func closeButtonAction(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /// Checks if fields are correct, if so, it will create an user in Firebase
    @IBAction func signUpActionButton(sender: UIButton) {
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
        
        guard passwordTextField.text == confirmPasswordTextField.text else {
            let passwordMatchAlert = alert.showAlertFor(.PasswordMatch)
            presentViewController(passwordMatchAlert, animated: true, completion: nil)
            return
        }
        
        firebase.createUser(emailTextField.text, password: passwordTextField.text, withValueCompletionBlock: { error, result in
            if error != nil {
                let emailTakenAlert = self.alert.showAlertFor(.EmailTaken)
                self.presentViewController(emailTakenAlert, animated: true, completion: nil)
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        })
    }
}

extension UserSignupViewController: UITextViewDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        /// Hides the keyboard
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()

        return true
    }
    
    /// This function dismisses the keyboard when user touches outside the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
 
 */
