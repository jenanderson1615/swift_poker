//
//  Game.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/17/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//

import Foundation

/**
 Keeps track of the the number of hands each player wins.  May just need to put this in AppDelegate.
    At the end, returns winner and their score. Keeps an array of hands to loop through for the
    to calculate the winner
*/
class Game
{
    var cardReader: Card_Creator!
    var allCards = [Card]()
    var player1 = [PlayerHand]()
    var player2 = [PlayerHand]()
    
    func createCardArray()
    {
        cardReader = Card_Creator()
        cardReader.printFileContents()
        allCards = cardReader.createCards()
    }
    
    //Takes the full array of 1000 cards and creates hand arrays
    //TODO next: make createHands method loop through all cards to create the player 1 
    //  and player 2 arrays (or dictionary) of hands. First 5 cards a player hand in
    //  1, second 5 in player 2 and so on
    func createHands()
    {
        
    }
}