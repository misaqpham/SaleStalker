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
    //var sectionTitles = ["Leave Feedback", "Follow Us"]
    var sectionContent = [["Revolve Clothing"],
                          ["Twitter", "Facebook", "Pinterest"]]
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
    
//    override func tableView(tableView: UITableView, titleForHeaderInSection
//        section: Int) -> String? {
//        return sectionTitles[section]
//    }

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
    
    
    
//    required init?(coder aDecoder: NSCoder) {
//        self.webView = WKWebView(frame: CGRectZero)
//        super.init(coder: aDecoder)
//        
//        self.webView.navigationDelegate = self
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//
//        view.addSubview(webView)
//        webView.translatesAutoresizingMaskIntoConstraints = false
//        let height = NSLayoutConstraint(item: webView, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
//        let width = NSLayoutConstraint(item: webView, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
//        view.addConstraints([height, width])
//        
//        let url = NSURL(string:"http://www.google.com")
//        let request = NSURLRequest(URL:url!)
//        webView.loadRequest(request)
//        
//    }
//    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}