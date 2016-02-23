//
//  ReceiptCell.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/21/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

class ReceiptCell: UITableViewCell {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var receiptLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 8
        self.bounds.size.height = 60
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
