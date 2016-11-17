//
//  DayMenuItemCell.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import UIKit

class DayMenuItemCell: UITableViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var noOfOrderedItemsLabel: UILabel!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    var onAddButtonTapped : (() -> Void)? = nil
    var onRemoveButtonTapped : (() -> Void)? = nil
    
    @IBAction func addButtonTapped(_ sender: Any) {
        onAddButtonTapped?()
    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        onRemoveButtonTapped?()
    }
    
    var product : Product?{
        didSet{
            updateUIOnProductChange()
        }
    }
    
    var numberOfItems: Int = 0 {
        didSet{
            updateUIOnProductChange()
        }
    }
    
    func updateUIOnProductChange() {
        guard let product = product else {
            return
        }
        
        nameLabel.text = product.name
        priceLabel.text = "\(product.price.stringValue)lei"
        if let image = product.imageUrl{
            cellImageView.image = UIImage(named: image)
        }
        
        if let orderItem = ShoppingCart.sharedInstance.existingOrderIdemFor(product: product){
            removeButton.isHidden = false
            noOfOrderedItemsLabel.isHidden = false
            noOfOrderedItemsLabel.text = "\(orderItem.numberOfItems)"
        }else{
            removeButton.isHidden = true
            noOfOrderedItemsLabel.isHidden = true
        }
    }
    
}
