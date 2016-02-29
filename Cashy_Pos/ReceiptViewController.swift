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
    
    @IBOutlet weak var receiptsTableView: UITableView!
    @IBOutlet weak var receiptLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - Extensions / Protocol Conformance

extension ReceiptViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sales.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = receiptsTableView.dequeueReusableCellWithIdentifier("cell") as! ReceiptDetailCell
        
        return cell
    }
}


extension ReceiptViewController: UITableViewDelegate {
    
}
