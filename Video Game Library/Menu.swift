//
//  Menu.swift
//  Video Game Library
//
//  Created by Sawyer Shirley on 9/11/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

class Menu {
    var shouldQuit = false //When this is true, we should quit running the video game library.
    
    func go() {
        //This function is going to make the menu run. It will display the menu and take user input until the user wishes to quit the app.
        while !shouldQuit {
            printMenu()
            quit()
        }
    }
    
    func printMenu() {
        print("""
Select an Option:
        * Add Game
        * Remove Game
        * List Available Games
        * Check Out Game
        * Check In Game
        * List Checked Out Games
        * Quit
""")
        
    }
    
    func quit() {
        //This function will be called when the user is ready to quit the app.
        shouldQuit = true
        //Show user a message.
        print("Thanks for using the Library!")
    }
    
    func getInput() -> String {
     var userInput = readLine()
        
        while userInput == nil || userInput == "" {
            print("Loading...")
            sleep(1)
            print("Invalid input")
            userInput = readLine()
            
    }
        
        return userInput!
    }
}











