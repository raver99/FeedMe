//
//  File.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import Foundation

protocol DataAccess {
    func getMenuFor(date:NSDate, completionHandler:([Product], NSError?) -> Void)
}