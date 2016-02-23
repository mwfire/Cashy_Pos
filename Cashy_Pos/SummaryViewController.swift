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
        transactionLabel.text = "\(saleDataSource.numbersOfItems())"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK - Extensions
extension SummaryViewController: UITableViewDataSource {
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saleDataSource.numbersOfItems()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = receiptTableView.dequeueReusableCellWithIdentifier("receiptCell") as! ReceiptCell
        
        let sale = saleDataSource.sales[indexPath.row]

        guard let product = sale.products, name = product[0].name  else {
            return cell
        }
        
        guard let total = sale.total else {
            return cell
        }
        
        guard let receipt = sale.receipt else {
            return cell
        }
        
        cell.itemLabel.text = "Item: \(name)"
        cell.totalLabel.text = "$\(total)"
        cell.receiptLabel.text = "Receipt: \(receipt)"
        return cell
    }
}

extension SummaryViewController: UITableViewDelegate {
    
}
