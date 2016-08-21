//
//  AppDelegate.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/6/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var resultView: Results!

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        resultView =  Results(nibName: "Results", bundle:NSBundle.mainBundle())
        self.window.contentView?.addSubview(resultView.view)
    }
	
    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }
}

