//
//  MockDataAccess.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

class MockDataAccess: DataAccess {
    func getMenuFor(date: NSDate, completionHandler: ([Product], NSError?) -> Void) {
        let product1 = Product()
        product1.name = "Goulash"
        product1.price = 20
        product1.imageUrl = NSBundle.mainBundle().pathForResource("Goulash", ofType: "jpg")
        
        let product2 = Product()
        product2.name = "Pizza"
        product2.price = 25
        product2.imageUrl = NSBundle.mainBundle().pathForResource("pizza", ofType: "jpg")
        
        let product3 = Product()
        product3.name = "Shawarma"
        product3.price = 15
        product3.imageUrl = NSBundle.mainBundle().pathForResource("Shawarma", ofType: "jpg")
        
        let productList : [Product] = [ product1, product2, product3 ]
        
        completionHandler(productList, nil)
    }
}
