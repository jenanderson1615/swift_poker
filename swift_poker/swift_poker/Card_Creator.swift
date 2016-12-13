//
//  Card_Creator.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/6/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//
//  

import Foundation

/**
 Uses file i/o to get the cards from game_hands, creates card object for each card, and assigns
 these cards to the correct hands and players
 */

class Card_Creator
{
    let fileName = "game_hands.txt"
    var text = ""

    /**
      Gets the contents of game hands and sets the text property to the content
     */
    func printFileContents()
    {
        let urlpath = Bundle.main.path(forResource: "game_hands", ofType: "txt")
        do
        {
            text = try String(contentsOfFile: urlpath!, encoding: String.Encoding.utf8)
        }
        catch
        {
            text = ""
        }
    }
        
    /**
     Create a card for each set of values and adds each card to the card array
     */
    func createCardArray() ->[Card]
    {
        let textArray = text.components(separatedBy: " ")
        var cardArray = [Card]()
        for card in textArray
        {
            if(card.components(separatedBy: "\n").count > 1)
            {
                let subArray = card.components(separatedBy: "\n")
                for subCard in subArray
                {
                    let newCardObject: Card!
                    newCardObject = Card()
                    newCardObject.rank = ((subCard as NSString).substring(to: 1) as NSString) as String
                    newCardObject.suit = (subCard as NSString).substring(from: 1)
                    cardArray.append(newCardObject)
                }
            }
            else
            {
                let newCardObject: Card!
                newCardObject = Card()
                newCardObject.rank = ((card as NSString).substring(to: 1) as NSString) as String
                newCardObject.suit = (card as NSString).substring(from: 1)
                cardArray.append(newCardObject)
            }
        }
        return cardArray
    }
}
