//
//  OrderItem.swift
//  FeedMe
//
//  Created by Roland Huhn on 27/10/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

class OrderItem: Equatable{
    let product : Product
    var numberOfItems: Int = 0
 
    init(product: Product) {
        self.product = product
    }
    
    static func ==(lhs: OrderItem, rhs: OrderItem) -> Bool{
        if lhs.product == rhs.product && lhs.numberOfItems == rhs.numberOfItems{
            return true
        }
        return false
    }
    
}
