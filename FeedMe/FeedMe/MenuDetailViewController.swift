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
            if let image = product.imageUrl{
                imageView.image = UIImage(named: image)
            }
        }
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func didClickAddToCart(_ sender: AnyObject) {
        NSLog("clicked add to cart")
        if let product = product {
            ShoppingCart.sharedInstance.add(product: product)
        }
    }

}
