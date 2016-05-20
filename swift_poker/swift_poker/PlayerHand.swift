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
	var handStrength = HandStrenghType.HighCard
	
    enum HandStrenghType: NSInteger
	{
        case RoyalFlush = 0
		case StraightFlush = 1
		case FourOfAKind = 2
		case FullHouse = 3
		case Flush = 4
		case Straight = 5
		case ThreeOfAKind = 6
		case TwoPair = 7
		case OnePair = 8
		case HighCard = 9
	}
	
	func getStrength()->HandStrenghType
	{
		if isRoyalFlush()
        {
            handStrength = HandStrenghType.RoyalFlush
        }
        else if isStraightFlush()
        {
            handStrength = HandStrenghType.StraightFlush
        }
        else if isFourOfAKind()
        {
            handStrength = HandStrenghType.FourOfAKind
        }
        else if isFullHouse()
        {
            handStrength = HandStrenghType.FullHouse
        }
        else if isFlush()
        {
            handStrength = HandStrenghType.Flush
        }
        else if isStraightFlush()
        {
            handStrength = HandStrenghType.StraightFlush
        }
        else if isThreeOfAKind()
        {
            handStrength = HandStrenghType.ThreeOfAKind
        }
        else if isTwoPair()
        {
            handStrength = HandStrenghType.TwoPair
        }
        else if isOnePair()
        {
            handStrength = HandStrenghType.OnePair
        }
        else
        {
            handStrength = HandStrenghType.HighCard
        }
        return handStrength
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
     Returns a sorted array of all the card rank values
     */
    func getAllCardRankScores() -> Array<Int>
    {
        var allRanks = [NSInteger]()
        for card in handCards
        {
            allRanks.append(card.rankScore())
        }
        return allRanks.sort()
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
        let allRanks = getAllCardRankScores()
        if allRanks[4] == 14 && allRanks[3] == 13 && allRanks[2] == 12 &&
           allRanks[1] == 11 && allRanks[0] == 10
        {
            return true
        }
        return false
	}
    
    /*
    @brief
    */
    func isStraightFlush() -> Bool
    {
        if(!isSameSuit())
        {
            return false
        }
        let allRanks = getAllCardRankScores()
        let compare1 = allRanks[4] == allRanks[3] + 1
        let compare2 = allRanks[3] == allRanks[2] + 1
        let compare3 = allRanks[2] == allRanks[1] + 1
        let compare4 = allRanks[1] == allRanks[0] + 1
        
        if  compare1 && compare2 && compare3 && compare4
        {
            return true
        }
        return false
    }

    /*
    @brief
    */
    func isFourOfAKind() -> Bool
    {
        let allRanks = getAllCardRankScores()
        let firstFour = allRanks[0] == allRanks[1] && allRanks[1] == allRanks[2] && allRanks[2] == allRanks[3]
        let lastFour = allRanks[1] == allRanks[2] && allRanks[2] == allRanks[3] && allRanks[3] == allRanks[4]
        if  firstFour || lastFour
        {
            return true
        }
        return false
    }
    
    /*
    @brief Returns true if there's 3 of one rank and 2 of another
    */
    func isFullHouse() -> Bool
    {
        let allRanks = getAllCardRankScores()
        
        //Check for first match
        let firstTwoMatch = allRanks[0] == allRanks[1]
        let firstThreeMatch = firstTwoMatch && allRanks[1] == allRanks[2]
        if !firstTwoMatch && !firstThreeMatch
        {
            return false
        }
        
        let lastTwoMatch = allRanks[4] == allRanks[3]
        let lastThreeMatch = lastTwoMatch && allRanks[2] == allRanks[3]
        if !lastTwoMatch && !lastThreeMatch
        {
            return false
        }

        return true
    }
    
    /*
    @brief Returns true all the suits are the same.  Assumes not a straight flush because its already 
        been checked.  Method mostly taken care of by isSameSuit, but this helps me make sure straight
        flush is being checked for
    */
    func isFlush() -> Bool
    {
        if(!isSameSuit())
        {
            return false
        }
        return true
    }
    
    /*
    @brief
    */
    func isThreeOfAKind() -> Bool
    {
        let allRanks = getAllCardRankScores()
        let firstThree = allRanks[0] == allRanks[1] && allRanks[1] == allRanks[2]
        let middleThree = allRanks[1] == allRanks[2] && allRanks[2] == allRanks[3]
        let lastThree = allRanks[2] == allRanks[3] && allRanks[3] == allRanks[4]
        if  firstThree || middleThree || lastThree
        {
            return true
        }
        return false
    }
    
    /*
    @brief
    */
    func isTwoPair() -> Bool
    {
        let allRanks = getAllCardRankScores()
        var firstPairPosition = -1
        
        if allRanks[0] == allRanks[1]
        {
            firstPairPosition = 0
        }
        else if allRanks[1] == allRanks[2]
        {
            firstPairPosition = 1
        }
        else if allRanks[2] == allRanks[3]
        {
            firstPairPosition = 2
        }
        else if allRanks[3] == allRanks[4]
        {
            firstPairPosition = 3
        }
        
        if firstPairPosition == -1
        {
            return false
        }
        
        //We have one pair at this point starting at allRanks[firstPairPosition] & allRanks[firstPairPosition + 1].  Can assume not the same pair otherwise card strength would be 4 pair
        var newArray = allRanks
        newArray.removeAtIndex(firstPairPosition + 1)
        newArray.removeAtIndex(firstPairPosition)
        
        if newArray[0] == newArray[1] || newArray[1] == newArray[2]
        {
            return true
        }
        return false
    }
    
    /*
    @brief
    */
    func isOnePair() -> Bool
    {
        let allRanks = getAllCardRankScores()
        
        if allRanks[0] == allRanks[1] || allRanks[1] == allRanks[2] || allRanks[2] == allRanks[3] || allRanks[3] == allRanks[4]
        {
            return true
        }
        return false
    }
    
    /**
     @brief Returns true if the cards are the same suits and there's an Ace, King, Queen, Jack, and 10 rank and false if hand is not a royal flush
     */
    func getHighestRank() -> NSInteger
    {
        let allRanks = getAllCardRankScores()
        return allRanks[4]
    }
}

