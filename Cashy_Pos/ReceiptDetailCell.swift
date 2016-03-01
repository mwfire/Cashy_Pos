//
//  ReceiptDetailCell.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 2/28/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

class ReceiptDetailCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
