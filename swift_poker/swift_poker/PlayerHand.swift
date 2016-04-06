//
//  PlayerHand.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/17/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//

import Foundation

/**
 Stores an array of 5 cards as a property and determines the hand strength.  If the strength
    is highest card, the game can call the highest card method to compare highest cards.
*/
class PlayerHand
{
    //Needs a hand strength property, enum for strength
    var handCards = [Card]()
	var cardStrength = 0
	
	enum handStrengh
	{
		case RoyalFlush
		case StraighFlush
		case FourOfAKind
		case FullHouse
		case Flush
		case Straight
		case ThreeOfAKind
		case TwoPair
		case OnePair
		case HighCard
	}
	
	func setStrength()
	{
		
	}
    
    /**
     @brief Returns an array of all the card suits
     */
    func getCardSuits() -> NSArray
    {
        var allSuits = [String]()
        for card in handCards
        {
            allSuits.append(card.suit)
        }
        return allSuits
    }
    
    /**
     @brief Returns an array of all the card suits
     */
    func getCardRanks() -> NSArray
    {
        var allRanks = [Card.rankType]
        for card in handCards
        {
            allRanks.append(card.rank)
        }
        return allRanks
    }
	
    /**
     @brief Returns true if all the suits are the same and false they're not all the same
     */
	func isSameSuit() -> Bool
	{
        let allSuits = getCardSuits()
        
        if (allSuits[0] as! String != allSuits[1] as! String
            || allSuits[0] as! String != allSuits[2] as! String
            || allSuits[0] as! String != allSuits[3] as! String
            || allSuits[0] as! String != allSuits[4] as! String)
        {
            return false
        }
        else
        {
            return true
        }
	}
	
    /**
     @brief Returns true if the cards are the same suits and there's an Ace, King, Queen, Jack, and 10 rank and false if hand is not a royal flush
     */
	func isRoyalFlush() -> Bool
	{
        if(!isSameSuit())
        {
            return false
        }
        let allRanks = getCardRanks()
        if allRanks.containsObject("A") && allRanks.containsObject("K") && allRanks.containsObject("Q") &&
            allRanks.containsObject("J") && allRanks.containsObject("10")
        {
            return true
        }
        return false
	}
}

