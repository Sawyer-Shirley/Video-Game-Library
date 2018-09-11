//
//  main.swift
//  Video Game Library
//
//  Created by Sawyer Shirley on 9/10/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

print("Welcome to the Video Game Library\n")

let menu = Menu()
menu.printMenu()

menu.go() //This handles running the logic loop for our video game library. Once we break out of this function, the menu will close.

