//
//  Library Class.swift
//  Video Game Library
//
//  Created by Sawyer Shirley on 9/13/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

class Library {
    //This array will hold all of our games.
    var arrayOfGames : [Game] = [Game(title: "Spiderman"), Game(title: "2k19"), Game(title: "Overwatch"), Game(title: "Elder Scrolls: 6")]
    //Lists the games that are checked out.
    func listUnavailableGames() {
        for game in arrayOfGames {
            if !game.checkedIn {
                print(game.title)
                if let dueDate = game.dueDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    print("\(game.title) is due on: \(dateFormatter.string(from: dueDate))")
                }
            }
        }
    }
    //Allows user to check a game in.
    func checkInGame() {
        for index in 0..<arrayOfGames.count {
            if arrayOfGames[index].checkedIn == false {
                print("\(index). \(arrayOfGames[index].title)")
            }
    }
        print("Please enter the index of the game you would like to check in:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        arrayOfGames[userInput!].checkedIn = true
        //We need to remove the due date since the game has been returned
        arrayOfGames[userInput!].dueDate = nil
    }
    
    //Allows a user to check out a game.
    func checkOutGame() {
        print("Games available to check out:")
        for index in 0..<arrayOfGames.count {
            if arrayOfGames[index].checkedIn == true {
            print("\(index). \(arrayOfGames[index].title)")
        }
    }
        print("Please enter the number of the game you wish to check out:")
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<arrayOfGames.count)
        
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        //Change the checkedIn value of our game element at the index provided by the user.
        arrayOfGames[userInput!].checkedIn = false
        
        //Use calendar to add time and establish due date
        let currentCalendar = Calendar.current
        let dueDate = currentCalendar.date(byAdding: .day, value: 14, to: Date())
        arrayOfGames[userInput!].dueDate = dueDate
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        print("Game is due for return on: \(dateFormatter.string(from: dueDate!))")
    }
    //Allows a user to remove a game.
    func removeGame() {
        //List all of our games with a number for the user to select
        for index in 0..<arrayOfGames.count {
            print("\(index). \(arrayOfGames[index].title)")
        }
        print("Please enter the number of the game you wish to remove:")
        
        var userInput = Int(readLine()!)
        let validGameIndex = Array(0..<arrayOfGames.count)
        
        while userInput == nil || !validGameIndex.contains(userInput!) {
            print("Invalid input. Try again.")
            userInput = Int(readLine()!)
        }
        arrayOfGames.remove(at: userInput!)
    }
    //Allows a user to add a game.
    func addGame() {
        //Prompt user to enter title for new game
        print("Please enter the title of the game you wish to add:")
        
        //Get title input and store in variable
        var newGameTitle = readLine()
        
        while newGameTitle == nil || newGameTitle == "" {
            print("Loading...")
            sleep(1)
            print("Invalid input. Please enter the game's title:")
            newGameTitle = readLine()
        }
        //Instantiate a new game with the title from user input.
        let newGame = Game(title: newGameTitle!)
        
        //Add new game object to our game array
        arrayOfGames.append(newGame)
    }
    //Lists all available games for the user.
    func listAvailableGames() {
        for game in arrayOfGames {
            if game.checkedIn {
                print(game.title)
            }
        }
    }
}

