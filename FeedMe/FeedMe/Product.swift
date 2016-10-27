//
//  Product.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

struct Product : Equatable{
    var name : String!
    var price : NSNumber!
    var imageUrl : String?
    
    static func ==(lhs: Product, rhs: Product) -> Bool{
        if lhs.name == rhs.name && lhs.price == rhs.price && lhs.imageUrl == rhs.imageUrl{
            return true
        }
        return false
    }
}
