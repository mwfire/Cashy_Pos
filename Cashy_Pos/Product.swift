//
//  Product.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/3/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit


struct Product  {
    // MARK: - Properties
    
    var name: String?
    var price: Double?
    var imageURL: NSURL?
    var selected: Bool? 
    var quantity: Int?
    
    // MARK: - Initialization
    
    init?(name: String, price: Double, imageURL: NSURL){
        self.name = name
        self.price = price
        self.imageURL = imageURL
        self.selected = false
        self.quantity = 0
        
        if name.isEmpty || price < 0 {
            return nil
        }
    }
}


