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

    /// When a product is selected, it adds the prices to display in the total label
    mutating func addPrices(indexPath: NSIndexPath ) -> Double {
        guard let price = products[indexPath.item].price else {
            return total
        }
        total += price
        return total
    }
    
    /// When a product is selected it turns the cell green
    mutating func turnSelectedCellGreenAtIndexPath(indexPath: NSIndexPath) -> Bool {
        guard products[indexPath.item].selected == false else {
            return false
        }
        products[indexPath.item].selected = true
        return products[indexPath.item].selected!
    }
    
    /// When a product is selected more than onece, it adds the quantity.
    mutating func addQuantity(indexPath: NSIndexPath) -> Int {
        products[indexPath.item].quantity! += 1
        return products[indexPath.item].quantity!
    }
    
    /// The products that have quantities. This is to create the instance of sale, to know how many products are in one sale.
    func getProductsWithQuantity() -> [Product] {
        var products = [Product]()
        for product in self.products {
            if product.quantity > 0 {
                products.append(product)
            }
        }
        return products
    }
    
    /// This resets the products, so that all green cells are deselected.
    mutating func resetProducts(){
        var products = [Product]()
        total = 0.0
        
        for var product in self.products {
            if product.selected == true {
                product.selected = false
                product.quantity = 0
                
                products.append(product)
                self.products = products
          
            } else if product.selected == false {
                products.append(product)
                self.products = products
            }
        }
    }
}













