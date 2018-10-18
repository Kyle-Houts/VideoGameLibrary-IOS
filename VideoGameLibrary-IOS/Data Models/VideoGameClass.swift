//
//  VideoGameClass.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit


class VideoGame {
    
    let title: String
    
    let rating: String
    
    let cover: UIImage?
    
    let genre: String
    
    let description: String
    
    var gameStatus: Bool
    
    var dueDate: Date?
    
    
    
    
    
    init(title: String, rating: String, cover: UIImage?, genre: String, description: String, gameStatus: Bool) {
        
        self.title = title
        self.rating = rating
        self.cover = cover
        self.genre = genre
        self.description = description
        self.gameStatus = gameStatus
       
        
    }
    
}
