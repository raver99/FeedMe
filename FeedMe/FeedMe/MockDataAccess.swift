//
//  MockDataAccess.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

class MockDataAccess: DataAccess {
    func getMenuFor(_ date: Date, completionHandler: ([Product], NSError?) -> Void) {
        
        let product1 = Product(name: "Goulash", price: 20, imageUrl: Bundle.main.path(forResource: "Goulash", ofType: "jpg")!)
        
        var product2 = Product()
        product2.name = "Pizza"
        product2.price = 25
        product2.imageUrl = Bundle.main.path(forResource: "pizza", ofType: "jpg")
        
        var product3 = Product()
        product3.name = "Shawarma"
        product3.price = 15
        product3.imageUrl = Bundle.main.path(forResource: "Shawarma", ofType: "jpg")
        
        let productList : [Product] = [product1, product2, product3 ]
        
        completionHandler(productList, nil)
    }
}
