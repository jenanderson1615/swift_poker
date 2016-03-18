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
    var cardReader: Card_Creator!

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        cardReader = Card_Creator()
        cardReader.printFileContents()
        cardReader.createCardArray()
    }

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }
}

