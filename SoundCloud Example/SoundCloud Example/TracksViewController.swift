//
//  TracksViewController.swift
//  SoundCloud Example
//
//  Created by Colodin on 08.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
class TracksViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var arrayTracks:NSArray! = nil
    var player:AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
    
    return arrayTracks.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cellString:String = "cellTrack"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellString) as UITableViewCell

        var track = self.arrayTracks.objectAtIndex(indexPath.row) as NSDictionary

        println(track["title"] as String)

        cell.textLabel.text = track["title"] as String

        return cell
    }
    
func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
{
    let track = self.arrayTracks.objectAtIndex(indexPath.row) as NSDictionary
    let streamURL = track["stream_url"] as String
    let account = SCSoundCloud.account()
    SCRequest.performMethod(SCRequestMethodGET, onResource: NSURL(string: streamURL), usingParameters: nil, withAccount: account, sendingProgressHandler: nil, responseHandler: {(response,data,error) in
        var playerError:NSError?
        self.player = AVAudioPlayer(data: data, error: &playerError)
        self.player?.prepareToPlay()
        self.player?.play()

        })
    
    }
}
