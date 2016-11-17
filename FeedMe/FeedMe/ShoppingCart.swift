//
//  ShoppingCart.swift
//  FeedMe
//
//  Created by Roland Huhn on 27/10/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

class ShoppingCart{
    var orderedItems = [OrderItem]()
    
    static let sharedInstance : ShoppingCart = ShoppingCart()

    
    func add(product: Product){
        NSLog("Item added to cart")
        if let orderItem = existingOrderIdemFor(product: product){
            orderItem.numberOfItems += 1
        }else{
            let orderItem = OrderItem(product: product)
            orderedItems.append(orderItem)
        }
    }
    
    func remove(product: Product){
        if let orderItem = existingOrderIdemFor(product: product){
           let index = orderedItems.index(of: orderItem)
            orderedItems.remove(at: index!)
        }
    }
    
    func existingOrderIdemFor(product:Product) -> OrderItem?{
        
        let itemsForProduct = orderedItems.filter { $0.product == product }
        
        assert(itemsForProduct.count <= 1 )
        
        return itemsForProduct.first
    }
}
