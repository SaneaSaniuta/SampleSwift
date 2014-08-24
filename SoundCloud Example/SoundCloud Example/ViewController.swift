//
//  ViewController.swift
//  SoundCloud Example
//
//  Created by Colodin on 03.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnGetTracks: UIButton!
    
    @IBAction func btnClickGetTracks() {
        
        let account:SCAccount = SCSoundCloud.account()
        
        var handler:SCRequestResponseHandler?
        handler = {(response,data,error) in
            
         var jsonError:NSError?
         var jsonResult: NSArray = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as  NSArray
            
            if let error = jsonError
            {
                println("Error jsonResult")
            }
            else
            {
                println("Count==",jsonResult.count)

                let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
                let newViewController:TracksViewController = mainStoryboard.instantiateViewControllerWithIdentifier("trackViewController") as TracksViewController
                newViewController.arrayTracks = jsonResult.copy() as NSArray
                self.presentViewController(newViewController, animated: true, completion: nil)

            }
        }

        let resourceURL:String = "https://api.soundcloud.com/me/tracks.json"
        SCRequest.performMethod(SCRequestMethodGET, onResource: NSURL(string: resourceURL), usingParameters: nil, withAccount: account, sendingProgressHandler: nil, responseHandler: handler)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //SCSoundCloud.removeAccess()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(animated: Bool)
    {   super.viewDidAppear(true)
        
        println("viewDidAppear")
        if SCSoundCloud.account() == nil
        {
            btnGetTracks.hidden = true
            
        println("SCSoundCloud.account()")
        SCSoundCloud.requestAccessWithPreparedAuthorizationURLHandler({(preparedURL) in
            println("preparedURL: ",preparedURL)
            
            var myLog : SCLoginViewController =  LoginViewController.loginView(preparedURL, completionHandler: {(error) in
                
                if error
                { println("Error")
                
                }else
                { println("Va bene")
                
                }
         
                
                })
            
            self.presentViewController(myLog, animated: true, completion: nil)
            
            })
        }else
        {  btnGetTracks.hidden = false
        
        } 
    }
    
}

