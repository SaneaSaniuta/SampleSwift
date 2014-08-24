//
//  ViewController.swift
//  Date Picker
//
//  Created by Colodin on 02.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var lblData: UILabel!
    @IBOutlet var pickerVar: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool)
    { super.viewWillAppear(true)
        lblData.text = pickerVar.date.description
    
    }

    @IBAction func pickerWhenChangedValue(sender: UIDatePicker) {
        
        lblData.text = sender.date.description
    }
}

