//
//  DayMenuViewController.swift
//  FeedMe
//
//  Created by Roland Huhn on 21/09/16.
//  Copyright © 2016 Roland Huhn. All rights reserved.
//

import UIKit
import Foundation

class DayMenuViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dayLabel: UILabel!
    
    var dataObject: String = ""
    let dayMenuItemCellIdentifier = "DayMenuItemCell"
    var dataAccess : DataAccess?
    var dayMenuItems : [Product] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        dataAccess = MockDataAccess()
        dataAccess?.getMenuFor(Date(), completionHandler: { [weak self] (dayMenuitems, error) in
            weak var weakSelf = self
            if error == nil {
                weakSelf?.dayMenuItems.append(contentsOf: dayMenuitems)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dayLabel.text = dataObject
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayMenuItems.count 
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DayMenuItemCell = tableView.dequeueReusableCell(withIdentifier: dayMenuItemCellIdentifier, for: indexPath) as! DayMenuItemCell
        
        configure(cell: cell, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: Constants.MenuDetailVC) as? MenuDetailViewController, indexPath.row < dayMenuItems.count else {
            return
        }
        
        let currentProduct = dayMenuItems[indexPath.row]
        detailVC.product = currentProduct
        navigationController?.pushViewController(detailVC, animated: true);
    }
    
    func configure(cell: DayMenuItemCell, for indexPath: IndexPath){
        
        let currentProduct = dayMenuItems[indexPath.row]
        
        cell.nameLabel.text = currentProduct.name
        cell.priceLabel.text = "\(currentProduct.price.stringValue)lei"
        if let image = currentProduct.imageUrl{
            cell.cellImageView.image = UIImage(named: image)
        }
        
        cell.addButton.tag = indexPath.row
        cell.removeButton.tag = indexPath.row
        
        if let orderItem = ShoppingCart.sharedInstance.existingOrderIdemFor(product: currentProduct){
            cell.removeButton.isHidden = false
            cell.noOfOrderedItemsLabel.isHidden = false
            cell.noOfOrderedItemsLabel.text = "\(orderItem.numberOfItems)"
        }else{
            cell.removeButton.isHidden = true
            cell.noOfOrderedItemsLabel.isHidden = true
        }
        
    }
    
    @IBAction func addButtonClicked(_ sender: AnyObject) {
        if let index = sender.tag {
            let currentProduct = dayMenuItems[index]
            ShoppingCart.sharedInstance.add(product: currentProduct)
            
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as? DayMenuItemCell
            configure(cell: cell!, for: indexPath)
        }
    }
    
    @IBAction func removeButtonClicked(_ sender: AnyObject) {
        
    }
    
}
