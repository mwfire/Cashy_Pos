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
    var image: UIImage?
    var selected: Bool? 
    var quantity: Int?
    
    // MARK: - Initialization
    
    init?(name: String, price: Double, image: UIImage){
        self.name = name
        self.price = price
        self.image = image
        self.selected = false
        self.quantity = 0
        
        if name.isEmpty || price < 0 {
            return nil
        }
    }
}


