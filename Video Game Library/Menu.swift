//
//  Menu.swift
//  Video Game Library
//
//  Created by Sawyer Shirley on 9/11/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

class Menu {
    
    let gameLibrary = Library()
    
    var shouldQuit = false //When this is true, we should quit running the video game library.
    
    func go() {
        //This function is going to make the menu run. It will display the menu and take user input until the user wishes to quit the app.
            while !shouldQuit {
            printMenu()
            var input = getInput()
            //We need input validation to make sure the value falls between 1 & 8
            handleInput(input)
        }
    }

    func validateInput(_ input: String) -> Bool {
       let validMenuOptions = Array(1...7)
        guard let number = Int(input) else {
            return false
        }
        return validMenuOptions.contains(number)
    }
    
    func printMenu() { //Lists the options for the user to select.
        print("""
Select an Option:
        * Add Game
        * Remove Game
        * List Available Games
        * Check Out Game
        * Check In Game
        * List Checked Out Games
        * Quit

        Select 1-7
""")
        
    }
    
    func handleInput(_ input: String) { //Allows the user to select a specfic option.
        switch input {
        case "1":
            gameLibrary.addGame()
            //call the library's add game function
        case "2":
            gameLibrary.removeGame()
            //Call the library's remove game function.
        case "3":
            gameLibrary.listAvailableGames()
            //List available games
        case "4":
            gameLibrary.checkOutGame()
            //Check out game
        case "5":
            gameLibrary.checkInGame()
            //Check in game
        case "6":
            gameLibrary.listUnavailableGames()
            //List checked out games
        case "7":
            //quit
            quit()
        default:
            break
        }
        
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











