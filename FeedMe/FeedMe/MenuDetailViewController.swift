//
//  MenuDetailViewController.swift
//  FeedMe
//
//  Created by Roland Huhn on 13/10/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {

    var product: Product? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let product = product {
            nameLabel.text = product.name
            priceLabel.text = "\(product.price.stringValue)lei"
        }
    }
    
    @IBAction func didClickAddToCart(_ sender: AnyObject) {
        NSLog("clicked add to cart")
    }

}
