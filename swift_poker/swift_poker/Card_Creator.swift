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
 
 Todo:
 
 1.Figure out loop for which player the card belongs to
 
 2.Add unit tests
 */

class Card_Creator
{
    let fileName = "game_hands.txt"
    var text = ""

    /**
      Gets the contents of game hands and sets the text property to the content 
     
      TODO: Remove the line to print the text when its no longer needed
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
        print(text)
    }
}