//
//  Scene2ViewController.swift
//  Scene
//
//  Created by Colodin on 31.07.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnToScene1() {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
}