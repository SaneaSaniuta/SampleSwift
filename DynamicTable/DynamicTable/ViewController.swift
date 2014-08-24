//
//  ViewController.swift
//  DynamicTable
//
//  Created by Colodin on 01.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {

    let kCellState = "cellStates"
    var arrayStates = [:]
    var arrayKeys  = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("StatesList", ofType: "plist")
        self.arrayStates = NSDictionary(contentsOfFile: path)
       
        // Do any additional setup after loading the view, typically from a nib.
        self.arrayKeys = self.arrayStates.allKeys
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
    
        return arrayStates.count;
    }
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
   {
    let cell: StateCell = tableView.dequeueReusableCellWithIdentifier(kCellState, forIndexPath: indexPath) as StateCell
    let text  = arrayKeys[indexPath.row] as String
    cell.lblNameState.text = text
    let img : UIImage = UIImage(named: text)
    cell.imgFlag.image = img;
    let capitale: NSArray = self.arrayStates.objectForKey(text) as NSArray
    cell.lblCapitalState.text = capitale[0] as String
    
    return cell
    }
func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
{
    let text  = arrayKeys[indexPath.row] as String
    let capitale: NSArray = self.arrayStates.objectForKey(text) as NSArray
    let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
    
    let second:SecondViewController = mainStoryboard.instantiateViewControllerWithIdentifier("secondController") as SecondViewController
    second.setDateState(capitale,state:text)
    self.navigationController.pushViewController(second, animated: true)
 
}
    
}

