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
    var sales = [Sale]()
    var total: Double?
    var receipt: Int = 01
    var refundReceipt: Int = 01
    
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
        
         /// Loads persitent data, and adds it to the products array in ProductDataSource
         if let products = productDataSource.loadProducts()  {
         productDataSource.products += products
         }
    }
    
    //MARK: - Actions
    
    @IBAction func payButtonAction(sender: UIButton) {
        if total <= 0 {
            showAlert("Selection Required", message: "Please select a product to sale", style: .Alert, button: "Ok", button2: "", handler: nil)
        } else {
        
        // Amount Alert
        let amountAlert = UIAlertController(title: "Exchange", message: "Enter amount you received", preferredStyle: .Alert)
        amountAlert.addTextFieldWithConfigurationHandler(nil)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let okButton = UIAlertAction(title: "Ok", style: .Default) { (ACTION) in
            guard let textField = amountAlert.textFields, let amountString = textField[0].text, let amount = Double(amountString) else {
                return
            }
            
            let totalChange = amount - self.total!
            
            // Change Alert
            let changeAlert = UIAlertController(title: "Return $\(totalChange)", message: "", preferredStyle: .Alert)
            changeAlert.addAction(UIAlertAction(title: "Go Back", style: .Cancel, handler: nil))
            changeAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (ACTION) in
            
                /// Creating an instance of sale
                let sale = Sale(date: NSDate(), products: self.productDataSource.getProductsWithQuantity(), total: self.total!, receipt: self.receipt, refund: false)
                self.sales.append(sale)
                print("Quantity PayButton: \(sale.products![0].quantity!) , Name PayButton: \(sale.products![0].name!)")
                print("Quantity Sales: \(self.sales[0].products![0].quantity!), Name Sales: \(self.sales[0].products![0].quantity!)")
                self.receipt += 1
                self.reset()
            }))
            self.presentViewController(changeAlert, animated: true, completion: nil)
        }
        
        amountAlert.addAction(okButton)
        amountAlert.addAction(cancelButton)
        presentViewController(amountAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonAction(sender: UIButton) {
        if total <= 0 {
            showAlert("Nothing to Cancel", message: "", style: .Alert, button: "Ok", button2: "", handler: nil)
        } else {
            showAlert("Cancel Sale?", message: "", style: .Alert, button: "Cancel", button2: "Ok", handler: { ACTION -> Void in
                self.reset()
            })
        }
    }
    
    @IBAction func refundButtonAction(sender: UIButton) {
        /// Creating an instance of refund
        if total <= 0 {
            showAlert("Selection Required", message: "Please select a product to refund", style: .Alert, button: "Ok", button2: "", handler: nil)
        } else {
            showAlert("Refund", message: "Continue with refund?", style: .Alert, button: "Cancel", button2: "Ok") { (ACTION) -> Void in
                let refund = Sale(date: NSDate(), products: self.productDataSource.getProductsWithQuantity(), total: self.total!, receipt: self.refundReceipt, refund: true)
                self.sales.append(refund)
                self.refundReceipt += 1
                self.reset()
            }
        }
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "summary" {
            let summaryViewController = segue.destinationViewController as! SummaryViewController
            print("Quantity Segue:\(sales[0].products![0].quantity!) , Name Segue: \(sales[0].products![0].name!)")
            summaryViewController.saleDataSource.sales = sales
        }
    }
    
    /// Unwind Segue
    @IBAction func unwindToSalesViewController(segue: UIStoryboardSegue) {
        if let addProductViewController = segue.sourceViewController as? AddProductViewController , let product = addProductViewController.product {
            /// **Step 2** Recives and Appends the instance of Product in the array of products in ProductDataSource.
            productDataSource.products.append(product)
            
            /// Saves persistant data
            productDataSource.saveProducts()
        }
    }
    
    //MARK: - Helper methods
    
    func update(total: Double) {
     totalLabel.text = "$ \(total)"
    }
    
    func reset(){
        for product in productDataSource.products {
            if product.selected == true {
                product.selected = false
                product.quantity = 0
            }
            productCollectionView.reloadData()
            productDataSource.total = 0.0
            self.total = 0.0
            totalLabel.text = "$ 0.0"
        }
    }
    
    func showAlert(title: String, message: String, style: UIAlertControllerStyle, button: String, button2: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        let button = UIAlertAction(title: button, style: .Cancel, handler: nil)

        alert.addAction(button)
        if button2 != "" {
        let button2 = UIAlertAction(title: button2, style: .Default, handler: handler)
         alert.addAction(button2)
        }
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

// MARK: - Extension / Delegate Conformance

extension SalesViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        total = productDataSource.addPrices(indexPath)
        update(total!)
        
        let cell = productCollectionView.cellForItemAtIndexPath(indexPath) as! ProductCell
        let cellSelected = productDataSource.turnSelectedCellGreenAtIndexPath(indexPath)
        
        if cellSelected {
            cell.greenImage.hidden = false
            cell.quantityLabel.hidden = false
            cell.blurEffect.hidden = true
            cell.blurEffectName.hidden = true
        }
        
        let quantity = productDataSource.addQuantity(indexPath)
        cell.quantityLabel.text = "\(quantity)"
        
        /// Creates an instance of a product, and its added to the local products array
//        let product = Product(name: productDataSource.products[indexPath.row].name!, price: productDataSource.products[indexPath.row].price!, image: productDataSource.products[indexPath.row].image!)
//        self.products.append(product!)
    }
}

/// DataSource conformance
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
        
        guard let name = productDataSource.products[indexPath.item].name else {
            return cell
        }
        
        cell.blurEffect.hidden = hidden
        cell.blurEffectName.hidden = hidden
        cell.greenImage.hidden = !hidden
        cell.quantityLabel.hidden = !hidden
        cell.productImage.image = productImage
        cell.quantityLabel.text = "\(productQuantity)"
        cell.priceLabel.text = "$ \(productPrice)"
        cell.nameLabel.text = name
        
        return cell
    }
}






