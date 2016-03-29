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
        createHands()
    }
    
    /**
    @brief Takes the full array of cards and creates the player1 and player2 arrays of all the hands
     */
    func createHands()
    {
        var count = 0;
        let handSize = 5;
        var newPlayer1Hand: PlayerHand!
        newPlayer1Hand = PlayerHand()
        var newPlayer2Hand: PlayerHand!
        newPlayer2Hand = PlayerHand()
        
        for card in allCards
        {
            if(count < handSize)
            {
                newPlayer1Hand.handCards.append(card)
            }
            else if(count >= handSize)
            {
                newPlayer2Hand.handCards.append(card)
            }
            
            if(newPlayer1Hand.handCards.count >= handSize)
            {
                player1.append(newPlayer1Hand)
                newPlayer1Hand = PlayerHand()
            }
            else if(newPlayer2Hand.handCards.count >= handSize)
            {
                player2.append(newPlayer2Hand)
                newPlayer2Hand = PlayerHand()
            }
            
            if(count == 9)
            {
                count = 0;
            }
            else
            {
                count += 1;
            }
        }
    }
}