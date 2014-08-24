//
//  Scene1ViewController.swift
//  Scene
//
//  Created by Colodin on 31.07.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit
class Scene1ViewController: UIViewController {
    
    @IBAction func btnScene2(sender: UIButton) {

        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
        let scene2:Scene2ViewController = mainStoryboard.instantiateViewControllerWithIdentifier("Scene2") as Scene2ViewController
        self.presentViewController(scene2, animated: true, completion: nil)

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