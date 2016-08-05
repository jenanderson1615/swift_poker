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
	let useTextFileCards = true

    func applicationDidFinishLaunching(aNotification: NSNotification)
    {
        pokerGame = Game()
        pokerGame.createCardArray();
		if(useTextFileCards)
		{
			decideWinner()
		}
		//uses test hands
		else
		{
			let player1Hand = pokerGame.testHand1()
			let player2Hand = pokerGame.testHand2()
			print(pokerGame.compareHands(player1Hand, player2: player2Hand))
		}
    }
	
	func decideWinner()
	{
		var handNumber = 0
		for playerHand1 in pokerGame.player1
		{
			let playerHand2 = pokerGame.player2[handNumber]
			let winner = pokerGame.compareHands(playerHand1, player2: playerHand2)
			if (winner == 1)
			{
				pokerGame.player1Score += 1;
			}
			else if(winner == 2)
			{
				pokerGame.player2Score += 1;
			}
			handNumber += 1
		}
		NSLog("player 1 score: %ld", pokerGame.player1Score)
		NSLog("player 2 score: %ld", pokerGame.player2Score)
	}

    func applicationWillTerminate(aNotification: NSNotification)
    {
        // Insert code here to tear down your application
    }
}

