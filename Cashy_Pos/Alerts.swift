//
//  Alerts.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/12/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

enum AlertType {
    case Email
    case Password
    case PasswordMatch
    case Error
    case ErrorLogin
    case EmailTaken
}

struct Alerts {
    // MARK: - Function Alert
    
    func showAlertFor(type: AlertType) -> UIAlertController{
        switch type {
        case .Password :
            let alert = UIAlertController(title: "Password", message: "Enter a Password", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
      
        case .Email :
            let alert = UIAlertController(title: "Email", message: "Please enter your e-mail", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
        
        case .PasswordMatch:
            let alert = UIAlertController(title: "Password", message: "Passwords do not match", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
            
        case .Error:
            let alert = UIAlertController(title: "Error", message: "There was an error, try again later", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
            
        case .ErrorLogin:
            let alert = UIAlertController(title: "Login Error", message: "Incorrect email or password", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
            
        case .EmailTaken:
            let alert = UIAlertController(title: "Alert", message: "This email is already registered", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            return alert
        }
    }
}