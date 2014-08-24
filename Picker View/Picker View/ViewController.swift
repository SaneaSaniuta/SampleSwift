//
//  ViewController.swift
//  Picker View
//
//  Created by Colodin on 02.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var lblState: UILabel!
    
    var arrayStates  = [:]
    var arrayKeys = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = NSBundle.mainBundle().pathForResource("StatesList", ofType: "plist")
        self.arrayStates = NSDictionary(contentsOfFile: path)
        self.arrayKeys = self.arrayStates.allKeys
        self.pickerView.transform = CGAffineTransformRotate(self.pickerView.transform,CGFloat(3.14/2))
        self.pickerView.selectRow(0, inComponent: 0, animated: true)
        self.lblState.text = arrayKeys[0] as String
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int
    {
        return 1;
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int
    {
    
        return arrayKeys.count;
    }
    
    func pickerView(pickerView: UIPickerView!, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView!
    {
        var imgView:UIImageView! = UIImageView(frame: CGRect(x: 0, y: 0, width: 23, height: 23))
        imgView.transform = CGAffineTransformRotate(imgView.transform,CGFloat(-3.14/2))
        let state = arrayKeys[row] as String
        let img : UIImage! = UIImage(named: state)
        imgView.image = img
        return imgView;
    }
    
    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {   lblState.text = arrayKeys[row] as String
    
    
    
    }
}

