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
//    let fileURL = NSURLfile://localhost/Users/steve/Documents/MyFile.txt
//    https://developer.apple.com/library/ios/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/AccessingFilesandDirectories/AccessingFilesandDirectories.html#//apple_ref/doc/uid/TP40010672-CH3-SW1
    
    //Goal for this class is simply print out the contents of game_hands.txt
    //Needs some cleanup
    func printFileContents()
    {
        let fileManager = NSFileManager.defaultManager()
//        let currentPath = fileManager.currentDirectoryPath
        
//        let dirPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
//            .UserDomainMask, true)
        
//        let fileList = try? fileManager.contentsOfDirectoryAtPath("/")
//        for filename in fileList!
//        {
//            print(filename)
//        }
        let databuffer = fileManager.contentsAtPath(fileName)
        print(databuffer)
    }

//    let url = NSURL
//    let baseURL = NSURL(string: "file:///path/to/web_root/")
//    let url = NSURL(string: "folder/file.html", relativeToURL: baseURL)
//    let absoluteURL = url.absoluteURL
//    println("absolute URL = \(absoluteURL)")
//    NSURL* url = [[NSBundle mainBundle] URLForResource:@"MyImage" withExtension:@"png"];
//    
//    let url = [[NSBundle mainBundle] URLForResource:@"MyImage" withExtension:@"png"];
    
    
    
////    var text = ""
//    var dataDictionary = ""
//    var myString:NSString? = ""
//    
//    var fileMgr: NSFileManager = NSFileManager.defaultManager()
//    var docsDir: String?
//    var dataFile: String?
//    
//    func printFileContents()
//    {
////        let filePath = NSBundle.mainBundle().pathForResource("game_hands", ofType:"txt")
////        let data = NString(contentsOfFile:filePath!)
////        print(data);
//        if let data = NSData(contentsOfFile: fileName) {
//            myString = NSString(data: data, encoding: NSUTF8StringEncoding)
//        }
//        
//        do
//        {
//            dataDictionary = try String(contentsOfFile: fileName, encoding: NSUTF8StringEncoding)
//        }
//        catch
//        {
//            
//        }
//        
//        dataFile =
//            docsDir?.stringByAppendingPathComponent("datafile.dat")
//        
//        
//        print(dataDictionary)
//        print(myString)
//    
//    }
}