//
//  Product.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/3/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

// Product should conform to  NSCoding for persistance, since it was disabled, its not conforming to it. 

class Product : NSObject {
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
        
        super.init()
        
        if name.isEmpty || price < 0 {
            return nil
        }
    }
    
    // MARK: - NSCoding ( Disabled )
    /*
    /// Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("products")
    
    /// Encode Data
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: Keys.nameKey)
        aCoder.encodeDouble(price!, forKey: Keys.priceKey)
        aCoder.encodeObject(image, forKey: Keys.imageKey)
    }
    
    /// Decode Data
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(Keys.nameKey) as? String
        let image = aDecoder.decodeObjectForKey(Keys.imageKey) as? UIImage
        let price = aDecoder.decodeDoubleForKey(Keys.priceKey)
        
        /// Must call designated initializer from self (Product)
        self.init(name: name!,price: price, image: image!)
    }
 */
}


