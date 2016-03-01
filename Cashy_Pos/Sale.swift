//
//  Sale.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/20/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import Foundation

struct Sale {
    // Properties
    
    var date: NSDate?
    var products: [Product]?
    var total: Double?
    var refund: Bool
    var receipt: Int?
    
    init(date: NSDate, products: [Product], total: Double, receipt: Int, refund: Bool) {
        self.date = date
        self.products = products
        self.total = total
        self.receipt = receipt
        self.refund = refund
    }
}
