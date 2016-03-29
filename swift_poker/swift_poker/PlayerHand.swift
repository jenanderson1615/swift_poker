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
	
	func isSameSuit() -> Bool
	{
		return false
	}
	
	func isRoyalFlush() -> Bool
	{
		return false
	}
}

