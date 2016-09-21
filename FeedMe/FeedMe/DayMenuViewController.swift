//
//  DayMenuViewController.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import UIKit

class DayMenuViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayLabel: UILabel!
    
    var dataObject: String = ""
    let dayMenuItemCellIdentifier = "DayMenuItemCell"
    var dataAccess : DataAccess?
    var dayMenuItems : [Product]?
    
    override func viewDidLoad() {
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.dataAccess = MockDataAccess()
        self.dataAccess!.getMenuFor(NSDate(), completionHandler: { (dayMenuitems, error) in
            if(error == nil){
                self.dayMenuItems = dayMenuitems
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        dayLabel.text = dataObject
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dayMenuItems!.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : DayMenuItemCell = tableView.dequeueReusableCellWithIdentifier(self.dayMenuItemCellIdentifier) as! DayMenuItemCell
        
        let currentProduct = self.dayMenuItems![indexPath.row]

        cell.nameLabel.text = currentProduct.name
        cell.priceLabel.text = currentProduct.price.stringValue + "lei"
        cell.cellImageView.image = UIImage(named: currentProduct.imageUrl!)
        
        return cell
    }
}
