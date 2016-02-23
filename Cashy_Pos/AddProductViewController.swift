//
//  AddProductViewController.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/3/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit
//import Firebase


class AddProductViewController: UIViewController {
    // MARK: - Properties
    // var firebase = Firebase(url: "https://cashy-pos.firebaseio.com")
    
    var product: Product?
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        priceTextField.delegate = self
    }
    
    // MARK: - Navigation 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            
            guard let name = nameTextField.text, price = Double (priceTextField.text!), image = imageField.image else {
                print("Missing information")
                return
            }
                /// **Step 1** Creates an instance of Product.
                product = Product(name: name, price: price, image: image)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func closeAction(sender: UIButton) {
       dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
       /// If the user has the keyboard out, once they click to select an image, it will dismiss the keyboard
        nameTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        
        presentAlert()
    }
    
    func presentAlert() {
        /// UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        // Action Alert
        let alert = UIAlertController(title: "Photo Selection", message: "", preferredStyle: .ActionSheet)
        
        // Take Photo Action Button
        alert.addAction(UIAlertAction(title: "Take a Photo", style: .Default) { (ACTION) in
            
            /// Allows photos to be taken.
            imagePickerController.sourceType = .Camera
            
            /// Presents the picker
            self.presentViewController(imagePickerController, animated: true, completion: nil)
            })
        
        // Browse Photos Action Button
        alert.addAction(UIAlertAction(title: "Browse Photos", style: .Default) { (ACTION) in
            
            /// Only allow photos to be picked, not taken.
            imagePickerController.sourceType = .PhotoLibrary
            
            /// Presents the picker
            self.presentViewController(imagePickerController, animated: true, completion: nil)
            })
       
        // Cancel Action Button
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        /// Presents the Alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

/*
With these extensions for the delegates we can control different parts of the app, such as
hiding the keyboard, and manipulating the UIImagePicker, which is in charge
of selecting or taking a picture for our product.
*/

// MARK: - UITextField delegate conformance

extension AddProductViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        /// Hides the keyboard
        nameTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        return true
    }
    
    /// This function dismisses the keyboard when user touches outside the keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// MARK:  UIImagePicker delegate conformance

extension AddProductViewController: UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        /// Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        /// The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        /// Set imageField to display the selected image.
        imageField.image = selectedImage
        
        /// Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
}


// MARK:  UINavigation delegagte conformance

extension AddProductViewController: UINavigationControllerDelegate {
    
}







