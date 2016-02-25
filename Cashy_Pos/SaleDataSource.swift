//
//  SaleDataSource.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/20/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

struct SaleDataSource {
   
    var sales = [Sale]()
    
    func numbersOfSections() -> Int {
        return 1
    }
    
    func numbersOfItems() -> Int {
        return sales.count
    }
    
    func cellRefund(indexPath: NSIndexPath) -> Bool {
        return sales[indexPath.row].refund
    }
}
