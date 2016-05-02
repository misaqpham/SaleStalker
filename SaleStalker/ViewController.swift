//
//  LoginViewController.swift
//  SaleStalker
//
//  Created by Misa Pham on 2/22/16.
//  Copyright © 2016 Misa Pham. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional","Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        return restaurantNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
            NSIndexPath) -> UITableViewCell {
            let cellIdentifier = "Cell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
            forIndexPath: indexPath)
            // Configure the cell...
            cell.textLabel?.text = restaurantNames[indexPath.row]
            return cell }
    
}

