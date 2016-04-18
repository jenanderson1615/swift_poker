//
//  Card.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/17/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//

import Foundation

class Card
{
    var rank = rankType.Two
    var suit = ""
	
	enum rankType: NSString
	{
		case Ace = "A"
		case King = "K"
		case Queen = "Q"
		case Jack = "J"
		case Ten = "T"
		case Nine = "9"
		case Eight = "8"
		case Seven = "7"
		case Six = "6"
		case Five = "5"
		case Four = "4"
		case Three = "3"
		case Two = "2"
	}
	
	/**
	@brief Returns the numerical power of the card rank
	*/
	func rankScore() -> NSInteger
	{
		var returnScore = -1;
		
		switch self.rank
		{
			case .Ace:
				returnScore = 14
			case .King:
				returnScore = 13
			case .Queen:
				returnScore = 12
			case .Jack:
				returnScore = 11
			case .Ten:
				returnScore = 10
			case .Nine:
				returnScore = 9
			case .Eight:
				returnScore = 8
			case .Seven:
				returnScore = 7
			case .Six:
				returnScore = 6
			case .Five:
				returnScore = 5
			case .Four:
				returnScore = 4
			case .Three:
				returnScore = 3
			case .Two:
				returnScore = 2
		}
		return returnScore
	}
    
    /**
     @brief
     */
    func setRankWithString(rankString: NSString)
    {
        switch rankString
        {
            case "A":
                rank = .Ace
            case "K":
                rank = .King
            case "Q":
                rank = .Queen
            case "J":
                rank = .Jack
            case "T":
                rank = .Ten
            case "9":
                rank = .Nine
            case "8":
                rank = .Eight
            case "7":
                rank = .Seven
            case "6":
                rank = .Six
            case "5":
                rank = .Five
            case "4":
                rank = .Four
            case "3":
                rank = .Three
            case "2":
                rank = .Two
            default:
                rank = .Two
        }
    }
}