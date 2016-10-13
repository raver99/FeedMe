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
        let cell : DayMenuItemCell = tableView.dequeueReusableCell(withIdentifier: self.dayMenuItemCellIdentifier, for: indexPath) as! DayMenuItemCell
        
        
        let currentProduct = dayMenuItems[indexPath.row]
        cell.nameLabel.text = currentProduct.name
        cell.priceLabel.text = "\(currentProduct.price.stringValue)lei"
        if let image = currentProduct.imageUrl{
            cell.cellImageView.image = UIImage(named: image)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboardName  = Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile")
        let storyBoard = UIStoryboard(name: storyboardName as! String, bundle: Bundle.main)
        let detailVc : MenuDetailViewController = storyBoard.instantiateViewController(withIdentifier: "menuDetailVC") as! MenuDetailViewController
        let currentProduct = self.dayMenuItems[indexPath.row]
        detailVc.product = currentProduct
        
        present(detailVc, animated: true, completion: nil)
    }
}
