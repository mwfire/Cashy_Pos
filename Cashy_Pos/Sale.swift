//
//  Sale.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/20/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import Foundation

class Sale {
    
    var date: NSDate?
    var products: [Product]?
    var total: Double?
    var receipt: Int?
    
    init(date: NSDate, product: [Product], total: Double, receipt: Int) {
        self.date = date
        self.products = product
        self.total = total
        self.receipt = receipt
    }
}
