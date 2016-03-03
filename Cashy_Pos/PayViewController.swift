//
//  PayViewController.swift
//  Cashy_Pos
//
//  Created by Jhoan Arango on 3/2/16.
//  Copyright © 2016 Jhoan Arango. All rights reserved.
//

import UIKit

private enum AnimationDirection {
    case Up
    case Down
}

class PayViewController: UIViewController {
    
    //MARK: - Properties

    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func payButtonAction(sender: UIButton) {
    }
    
    @IBAction func refundButtonAction(sender: UIButton) {
    }
    
    @IBAction func cancelButtonAction(sender: UIButton) {
    }
}
