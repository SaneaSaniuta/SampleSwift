//
//  ViewController.swift
//  Social Networks
//
//  Created by Colodin on 02.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//
//
import UIKit

class ViewController: UIViewController {
                            
    @IBAction func btnFacebookClick(sender: UIButton) {
        var viewFacebook:FacebookViewController! = FacebookViewController()
        self.navigationController.pushViewController(viewFacebook, animated: true)
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

