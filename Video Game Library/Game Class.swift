//
//  Game Class.swift
//  Video Game Library
//
//  Created by Sawyer Shirley on 9/10/18.
//  Copyright © 2018 Sawyer Shirley. All rights reserved.
//

import Foundation

class Game {
    let title: String
    var checkedIn: Bool = true
    var dueDate: Date?
    
    init(title: String, checkedIn: Bool, dueDate: Date?) {
        self.checkedIn = checkedIn
        self.title = title
        self.dueDate = dueDate
        
        
    }
    
    
}













