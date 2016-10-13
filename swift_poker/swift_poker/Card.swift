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
    var rank = rankType.two
    var suit = ""
	
	enum rankType: NSString
	{
		case ace = "A"
		case king = "K"
		case queen = "Q"
		case jack = "J"
		case ten = "T"
		case nine = "9"
		case eight = "8"
		case seven = "7"
		case six = "6"
		case five = "5"
		case four = "4"
		case three = "3"
		case two = "2"
	}
	
	/**
	@brief Returns the numerical power of the card rank
	*/
	func rankScore() -> NSInteger
	{
		var returnScore = -1;
		
		switch self.rank
		{
			case .ace:
				returnScore = 14
			case .king:
				returnScore = 13
			case .queen:
				returnScore = 12
			case .jack:
				returnScore = 11
			case .ten:
				returnScore = 10
			case .nine:
				returnScore = 9
			case .eight:
				returnScore = 8
			case .seven:
				returnScore = 7
			case .six:
				returnScore = 6
			case .five:
				returnScore = 5
			case .four:
				returnScore = 4
			case .three:
				returnScore = 3
			case .two:
				returnScore = 2
		}
		return returnScore
	}
    
    /**
     @brief
     */
    func setRankWithString(_ rankString: NSString)
    {
        switch rankString
        {
            case "A":
                rank = .ace
            case "K":
                rank = .king
            case "Q":
                rank = .queen
            case "J":
                rank = .jack
            case "T":
                rank = .ten
            case "9":
                rank = .nine
            case "8":
                rank = .eight
            case "7":
                rank = .seven
            case "6":
                rank = .six
            case "5":
                rank = .five
            case "4":
                rank = .four
            case "3":
                rank = .three
            case "2":
                rank = .two
            default:
                rank = .two
        }
    }
}
