//
//  ProductCell.swift
//  Cashy
//
//  Created by Jhoan Arango on 2/4/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    //MARK: - Properties
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var greenImage: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var blurEffect: UIImageView!
    @IBOutlet weak var blurEffectName: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!


    //MARK: - Methods

    /// This method makes the product images corners round
   override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 8.0
        blurEffect.layer.cornerRadius = 5.0
        blurEffectName.layer.cornerRadius = 5.0
    }
    
}
