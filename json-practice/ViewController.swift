//
//  ViewController.swift
//  json-practice
//
//  Created by Adrian Padua on 6/14/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit
import SwiftyJSON


class ViewController: UITableViewController {

    var numberOfRows = 0
    var namesArray = [String]()
    var benefitsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
    }
    
    func parseJSON() {
        
        let path: String = NSBundle.mainBundle().pathForResource("Feats_PFRPG_Core", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        numberOfRows = 15
        
        for i in 1...15 {
            let feat = "\(i)"
            let name = readableJSON["Feats", feat, "name"].string! as String!
            let benefit = readableJSON["Feats", feat, "benefit"].string! as String!
            
            print(name)
            namesArray.append(name)
            benefitsArray.append(benefit)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewControllerDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        if namesArray.count != 0 {
            cell.textLabel!.text = namesArray[indexPath.row]
        }
        
        return cell
    }
}

