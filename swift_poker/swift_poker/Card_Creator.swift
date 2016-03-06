//
//  Card_Creator.swift
//  swift_poker
//
//  Created by Jennifer Loecker on 3/6/16.
//  Copyright © 2016 Jennifer Loecker. All rights reserved.
//
//  
/*!

@class Card_Creator.swift

@abstract Uses file i/o to get the cards from game_hands, creates card object for each card, and assigns
    these cards to the correct hands and players

@updated 2016-3-06

Todo:

Add file i/o method
Figure out loop for which player the card belongs to
Add unit tests

*/


import Foundation

class Card_Creator
{
    let fileName = "game_hands.txt"
    
    func printFileName()
    {
        print(fileName)
    }
}