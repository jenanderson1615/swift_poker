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
        let urlpath = NSBundle.mainBundle().pathForResource("game_hands", ofType: "txt")
        do
        {
            text = try String(contentsOfFile: urlpath!, encoding: NSUTF8StringEncoding)
        }
        catch
        {
            text = ""
        }
    }
    
    /**
     Create a card for each set of values and adds each card to the card array
     */
    func createCards() ->[Card]
    {
        let textArray = text.componentsSeparatedByString(" ")
        var cardArray = [Card]()
        for card in textArray
        {
            if(card.componentsSeparatedByString("\n").count > 1)
            {
                let subArray = card.componentsSeparatedByString("\n")
                for subCard in subArray
                {
                    let newCardObject: Card!
                    newCardObject = Card()
                    newCardObject.rank = (subCard as NSString).substringToIndex(1)
                    newCardObject.suit = (subCard as NSString).substringFromIndex(1)
                    cardArray.append(newCardObject)
                }
            }
            else
            {
                let newCardObject: Card!
                newCardObject = Card()
                newCardObject.rank = (card as NSString).substringToIndex(1)
                newCardObject.suit = (card as NSString).substringFromIndex(1)
                cardArray.append(newCardObject)
            }
        }
        return cardArray
    }
}