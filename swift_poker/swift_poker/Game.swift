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
	
	var player1Score = 0
	var player2Score = 0
    var totalGames = 0
    var winnerScore = 0
    
    /**
     @brief Calls methods to read from game_hands.txt and create the player arrays
     */
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
	
	/**
	@brief Takes 2 player hands and returns which player hand has a higher strength
	TODO: Need to handle comparison between one pairs.
	*/
	func compareHands(_ player1: PlayerHand, player2: PlayerHand) -> NSInteger
	{
        totalGames += 1
		if(player1.getStrength() > player2.getStrength())
		{
			return 1
		}
		else if(player2.getStrength() > player1.getStrength())
		{
			return 2
		}
        else if(player1.handStrength == 1 && player2.handStrength == 1)
        {
			return onePairWinner(player1, player2: player2)
        }
		else if(player1.handStrength == 0 && player2.handStrength == 0)
		{
			return highestCardWinner(player1, player2: player2)
		}
		else
		{
			NSLog("there was a hand strength not equal to 1 or 0")
			return 0;
		}
	}
	
	/**
	@brief Gets the winner if the strength for both players is highest card
	*/
	func onePairWinner(_ player1: PlayerHand, player2: PlayerHand) -> NSInteger
	{
		let player1Ranks = player1.getAllCardRankScores()
		let player2Ranks = player2.getAllCardRankScores()
		let player1PairRank = player1Ranks[player1.firstPairPosition]
		let player2PairRank = player2Ranks[player2.firstPairPosition]
		
		if(player1PairRank > player2PairRank)
		{
			return 1;
		}
		else if(player2PairRank > player1PairRank)
		{
			return 2;
		}
		else
		{
			return highestCardWinner(player1, player2: player2)
		}
	}
	
	/**
	@brief Gets the winner if the strength for both players is highest card
	*/
	func highestCardWinner(_ player1: PlayerHand, player2: PlayerHand) -> NSInteger
	{
		if(player1.getHighestRank() > player2.getHighestRank())
		{
			return 1;
		}
		else if(player2.getHighestRank() > player1.getHighestRank())
		{
			return 2;
		}
		else
		{
			NSLog("highest card strength and there was no highest rank")
			return 0;
		}
	}
    
    func calculateHandsWon()
    {
        var handNumber = 0
        for playerHand1 in player1
        {
            let playerHand2 = player2[handNumber]
            let winner = compareHands(playerHand1, player2: playerHand2)
            if (winner == 1)
            {
                player1Score += 1;
            }
            else if(winner == 2)
            {
                player2Score += 1;
            }
            handNumber += 1
        }
    }
    
    func calculateWinner() -> NSString
    {
        if(player1Score > player2Score)
        {
            winnerScore = player1Score
            return "Player 1"
        }
        else
        {
            winnerScore = player2Score
            return "Player 2"
        }
    }
}
