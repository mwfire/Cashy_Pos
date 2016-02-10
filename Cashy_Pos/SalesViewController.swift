//
//  ViewController.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/2/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

class SalesViewController: UIViewController {
    // MARK: - Properties
    
    var productDataSource = ProductDataSource()
    
    /// CollectionView
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    /// Buttons outlets
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var refundButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        productCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Loads persitant data, and adds it to the products array in ProductDataSource
        if let products = productDataSource.loadProducts()  {
            productDataSource.products += products
        }
    }
    
    //MARK: - Actions
    
    @IBAction func payButtonAction(sender: UIButton) {
    }
    
    @IBAction func cancelButtonAction(sender: UIButton) {
        for product in productDataSource.products {
            if product.selected == true {
                product.selected = false
                product.quantity = 0
            }
            productCollectionView.reloadData()
            productDataSource.total = 0.0
            totalLabel.text = "$ 0.0"
        }
    }
    
    @IBAction func refundButtonAction(sender: UIButton) {
        productCollectionView.allowsSelection = true
    }

    // MARK: - Navigation
    
    /// Unwind Segue
    @IBAction func unwindToSalesViewController(segue: UIStoryboardSegue) {
        if let addProductViewController = segue.sourceViewController as? AddProductViewController , let product = addProductViewController.product {
            /// **Step 2** Appends the instance of Product in the array of products in ProductDataSource.
            productDataSource.products.append(product)
            
            /// Saves persistant data
            productDataSource.saveProducts()
        }
    }
    
    //MARK: - Helper methods
    
    func update(total: Double) {
     totalLabel.text = "$ \(total)"
    }
}

// MARK: - Delegate Extension

extension SalesViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let total = productDataSource.addPrices(indexPath)
        update(total)
        
        let cellSelected = productDataSource.turnSelectedCellGreenAtIndexPath(indexPath)
        let cell = productCollectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        
        if cellSelected {
            cell.greenImage.hidden = false
            cell.quantityLabel.hidden = false
            cell.blurEffect.hidden = true
        }
        
        let quantity = productDataSource.addQuantity(indexPath)
        cell.quantityLabel.text = "\(quantity)"
    }
}

// MARK: - DataSoruce Extension

extension SalesViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productDataSource.numbersOfItems()
    }
    
    /// Creates, and recreates a cell.
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ProductCell
        
        guard let productImage = productDataSource.products[indexPath.item].image else {
            return cell
        }
        
        guard let productQuantity = productDataSource.products[indexPath.item].quantity else {
            return cell
        }
        
        guard let productPrice = productDataSource.products[indexPath.item].price else {
            return cell
        }
        
        guard let hidden = productDataSource.products[indexPath.item].selected else {
            return cell
        }
        
        cell.blurEffect.hidden = hidden
        cell.greenImage.hidden = !hidden
        cell.quantityLabel.hidden = !hidden
        cell.productImage.image = productImage
        cell.quantityLabel.text = "\(productQuantity)"
        cell.priceLabel.text = "$ \(productPrice)"
        
        return cell
    }
}





