//
//  FacebookViewController.swift
//  Social Networks
//
//  Created by Colodin on 02.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit
class FacebookViewController: UIViewController,FBLoginViewDelegate {
    
    @IBOutlet var profilePictureView: FBProfilePictureView!

    @IBOutlet var nameLabel: UILabel!

    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var btnPostOutlet: UIButton!
    
    init() {
        super.init(nibName: "FacebookViewController", bundle: NSBundle.mainBundle())
        var permissions: [AnyObject] = ["public_profile", "email", "user_friends"];
        var loginView:FBLoginView = FBLoginView(readPermissions: permissions)
        loginView.delegate = self;
        
        loginView.frame = CGRectOffset(loginView.frame, (self.view.center.x - (loginView.frame.size.width / 2)), 5)
        loginView.center = self.view.center
        
        self.view.addSubview(loginView)
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView?, user: AnyObject){
        var userObj: NSDictionary = user as NSDictionary
        profilePictureView!.profileID = userObj["id"] as String
        nameLabel!.text = userObj["name"] as String
        println("loginViewFetchedUserInfo")
        let text = userObj["name"] as String
        println(text)
        
        
    }
    
    func loginViewShowingLoggedInUser(loginView: FBLoginView?) {
        statusLabel!.text = "You're logged in as"
        println("loginViewShowingLoggedInUser")
        
 
        btnPostOutlet.hidden = false
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView?) {
        profilePictureView!.profileID = nil
        nameLabel!.text = ""
        statusLabel!.text = "You're not logged in!"
        println("loginViewShowingLoggedOutUser")
        btnPostOutlet.hidden = true
    }
    
    func handleError(loginView: FBLoginView?, error: NSError?) {
        var alertTitle: NSString?
        var alertMessage: NSString?
        
        if (FBErrorUtility.shouldNotifyUserForError(error)) {
            alertTitle = "Facebook error"
            alertMessage = FBErrorUtility.userMessageForError(error)
            
        } else if (FBErrorUtility.errorCategoryForError(error) == FBErrorCategory.AuthenticationReopenSession) {
            
            alertTitle = "Session Error"
            alertMessage = "Your current session is no longer valid. Please log in again."
            

        } else if (FBErrorUtility.errorCategoryForError(error) == FBErrorCategory.UserCancelled) {
            NSLog("user cancelled login")
            
        } else {
            alertTitle  = "Something went wrong"
            alertMessage = "Please try again later."
            NSLog("Unexpected error:%@", error!)
        }
        
        if alertMessage {
            var alertView: UIAlertView = UIAlertView(title: alertTitle, message: alertMessage, delegate: nil, cancelButtonTitle: "OK")
            
            alertView.show()
        }
        
    }
    
    
    @IBAction func btnPostClick(sender: UIButton) {
        self.shareToFacebook("SAnea saniuta")
    }
    
    func shareToFacebook(str:String)
    {
        FBWebDialogs.presentFeedDialogModallyWithSession(FBSession.activeSession(), parameters: nil, handler: { (result, resultURL, error) in
            println("Fine task")

            if !error
            { println("Post ok")
            }else
            {
            println(resultURL)
            println(error.description)

            }

            })
        
       
      
    }
    
}

