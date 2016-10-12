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
    var dayMenuItems : [Product]? {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        tableView.delegate = self;
        tableView.dataSource = self;
        
        dataAccess = MockDataAccess()
        dataAccess?.getMenuFor(Date(), completionHandler: { [weak self] (dayMenuitems, error) in
            weak var weakSelf = self
            if error == nil {
                weakSelf?.dayMenuItems?.append(contentsOf: dayMenuitems)
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dayLabel.text = dataObject
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayMenuItems?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : DayMenuItemCell = tableView.dequeueReusableCell(withIdentifier: self.dayMenuItemCellIdentifier, for: indexPath) as! DayMenuItemCell
        
        guard let count = dayMenuItems?.count, count < indexPath.row else {
            return cell
        }
        let currentProduct = self.dayMenuItems?[indexPath.row]
        cell.nameLabel.text = currentProduct?.name
        cell.priceLabel.text = "\(currentProduct?.price.stringValue ?? " ")lei"
        if let image = currentProduct?.imageUrl{
            cell.cellImageView.image = UIImage(named: image)
        }
        
        return cell
    }
}
