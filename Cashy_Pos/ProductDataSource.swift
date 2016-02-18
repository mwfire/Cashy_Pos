//
//  ProductDataSource.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/3/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit


struct ProductDataSource {
    //MARK - Properties

    /// **Step 3** Instances of product are appended to this Array.
    var products = [Product]()
    var total = 0.00

    //MARK - Saving & Loading data methods ( Disabled )
    /*
    
    func saveProducts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(products, toFile: Product.ArchiveURL.path!)
        guard !isSuccessfulSave  else {
            return
        }
        print("Failed to save Products...")
    }
    
    func loadProducts() -> [Product]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Product.ArchiveURL.path!) as? [Product]
    }
 */
}

//MARK: - DataSource for productCollectionView

extension ProductDataSource {
    
    func numbersOfSections() -> Int {
        return 1
    }
    
    func numbersOfItems() -> Int {
        return products.count
    }
}

//MARK: - Calculations & 

extension ProductDataSource {

    mutating func addPrices(indexPath: NSIndexPath ) -> Double {
        guard let price = products[indexPath.item].price else {
            return total
        }
        total += price
        return total
    }
    
    func turnSelectedCellGreenAtIndexPath(indexPath: NSIndexPath) -> Bool {
        guard products[indexPath.item].selected == false else {
            return false
        }
        products[indexPath.item].selected = true
        return products[indexPath.item].selected!
    }
    
    func addQuantity(indexPath: NSIndexPath) -> Int {
        products[indexPath.item].quantity! += 1
        return products[indexPath.item].quantity!
    }
}













