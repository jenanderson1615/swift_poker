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
    var pokerGame: Game!
    var resultView: Results!
	let useTextFileCards = true

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        pokerGame = Game()
        resultView =  Results(nibName: "Results", bundle:NSBundle.mainBundle())
        self.window.contentView?.addSubview(resultView.view)
    
        pokerGame.createCardArray();
		if(useTextFileCards)
		{
			pokerGame.decideWinner()
		}
		//uses test hands
		else
		{
			let player1Hand = pokerGame.testHand1()
			let player2Hand = pokerGame.testHand2()
			print(pokerGame.compareHands(player1Hand, player2: player2Hand))
		}
    }
	
	
    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }
}

