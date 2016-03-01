//
//  SummaryViewController.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/20/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit


class SummaryViewController: UIViewController {
    
    // MARK: - Properties
    
    var saleDataSource = SaleDataSource()

    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var receiptTableView: UITableView!
    @IBOutlet weak var salesLabel: UILabel!
    @IBOutlet weak var refundsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        updateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "receipt" {
            let receiptViewController = segue.destinationViewController as! ReceiptViewController
            
            if let selectedSaleCell = sender  as? ReceiptCell {
                let indexPath = receiptTableView.indexPathForCell(selectedSaleCell)!
                let selectedSale = saleDataSource.sales[indexPath.item]
                receiptViewController.sales.append(selectedSale)
            }
        }
    }
    
    // MARK: - Helper Methods
    
    func updateView(){
        var totalSale = 0.0
        var totalRefund = 0.0
        var numberOfRefunds = 0
        
        for sale in saleDataSource.sales {
            if sale.refund != true {
                totalSale += sale.total!
            }
        }
        
        for refund in saleDataSource.sales {
            if refund.refund == true {
                totalRefund -= refund.total!
                numberOfRefunds += 1
            }
        }
        salesLabel.text = "$\(totalSale)"
        refundsLabel.text = "\(numberOfRefunds) / $\(totalRefund)"
        totalLabel.text = "$\(totalSale + totalRefund) "
        transactionLabel.text = "\(saleDataSource.numbersOfItems())"
    }
}

// MARK: - Extensions
extension SummaryViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleDataSource.numbersOfItems()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = receiptTableView.dequeueReusableCellWithIdentifier("cell") as! ReceiptCell
        
        let sale = saleDataSource.sales[indexPath.row]
        
        guard let products = sale.products  else {
            return cell
        }
        
        guard let total = sale.total else {
            return cell
        }
        
        guard let receipt = sale.receipt else {
            return cell
        }
        
        if sale.refund == true {
            cell.receiptLabel.textColor = UIColor.redColor()
            cell.totalLabel.textColor = UIColor.redColor()
            cell.itemLabel.textColor = UIColor.redColor()
            cell.receiptLabel.text = "Refund: \(receipt)"
        } else {
            cell.receiptLabel.textColor = UIColor(red: 111/255, green: 111/255, blue: 111/255, alpha: 255)
            cell.totalLabel.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 255)
            cell.itemLabel.textColor = UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 255)
            cell.receiptLabel.text = "Receipt: \(receipt)"
        }
        
        for product in products {
            cell.itemLabel.text = "Item: \(product.name!)"
        }
        cell.totalLabel.text = "$\(total)"
        
        return cell
    }
}

extension SummaryViewController: UITableViewDelegate {

}

