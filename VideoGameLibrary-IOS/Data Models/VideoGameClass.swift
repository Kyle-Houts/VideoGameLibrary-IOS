//
//  VideoGameClass.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit


class VideoGame {
    
    var title: String
    
    var rating: String
    
    var cover: UIImage?
    
    var genre: String
    
    var description: String
    
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
