//
//  Results.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 8/21/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//

import Cocoa

class Results: NSViewController {

    // MARK: Properties
    @IBOutlet weak var winnerName: NSTextField!
    @IBOutlet weak var numGamesWon: NSTextField!
    @IBOutlet weak var totalGames: NSTextField!
    
    var pokerGame: Game!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pokerGame = Game()
        pokerGame.createCardArray();
        pokerGame.calculateHandsWon()
        totalGames.stringValue = "\(pokerGame.totalGames)"
        winnerName.stringValue = pokerGame.calculateWinner() as String
        numGamesWon.stringValue =  "\(pokerGame.winnerScore)"
    }
    
}
