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
    var ageArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parseJSON()
    }
    
    func parseJSON() {
        
        let path: String = NSBundle.mainBundle().pathForResource("SampleJSON", ofType: "json") as String!
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        numberOfRows = readableJSON["People"].count
        
        for i in 1...15 {
            var Person = "Person"
            Person += "\(i)"
            let name = readableJSON["People", Person, "Name"].string! as String!
            let age = readableJSON["People", Person, "Age"].string! as String!
            
            print(name)
            namesArray.append(name)
            ageArray.append(age)
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

