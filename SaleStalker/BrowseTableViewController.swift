//
//  BrowseController.swift
//  SaleStalker
//
//  Created by Misa Pham on 4/5/16.
//  Copyright © 2016 Misa Pham. All rights reserved.
//

import Foundation
import WebKit
import SafariServices
import UIKit

class BrowseTableViewController: UITableViewController {
    
    //var webView: WKWebView
    var sectionContent = [["Revolve Clothing"]]
    var links = ["https://revolve.com"]
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:
        Int) -> Int {
       
            return 1
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        // Configure the cell...
        cell.textLabel?.text = sectionContent[indexPath.section][indexPath.row]
        return cell
        
        
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath
        indexPath: NSIndexPath) {
        if let url = NSURL(string: links[indexPath.row]) {
            let safariController = SFSafariViewController(URL: url, entersReaderIfAvailable: true)
            presentViewController(safariController, animated: true, completion: nil)
        }

    }
      
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}