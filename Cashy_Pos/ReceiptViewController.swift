//
//  ReceiptViewController.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/28/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    //MARK: - Properties
    
    var sales = [Sale]()
    var products = [Product]()
    
    @IBOutlet weak var receiptsTableView: UITableView!
    @IBOutlet weak var receiptLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillDisappear(animated: Bool) {
        sales.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for product in sales[0].products! {
            products.append(product)
        }
        updateView()
    }
    
    //MARK: - Helper Methods
    
    func updateView() {
        let sale = sales[0]
        let salesDate = sale.date
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let convertedDate = dateFormatter.stringFromDate(salesDate!)
    
        dateLabel.text = convertedDate
        receiptLabel.text = "\(sale.receipt!)"
        totalLabel.text = "$\(sale.total!)"
    }
}

// MARK: - Extensions / Protocol Conformance

extension ReceiptViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = receiptsTableView.dequeueReusableCellWithIdentifier("cell") as! ReceiptDetailCell
        
        let product = products[indexPath.item]
        cell.nameLabel.text = product.name
        cell.quantityLabel.text = "\(product.quantity!)"
        cell.priceLabel.text = "$\(product.price!)"
        
        return cell
    }
}

extension ReceiptViewController: UITableViewDelegate {
    
}
