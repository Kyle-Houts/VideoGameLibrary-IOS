//
//  GameManager.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/17/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class GameManager {
    
    // Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    
    // We are creating a private initializer so that no instance of this class can be made anywhere else
    private init() {
        videoGameArray[1].dueDate = Date()
        videoGameArray[3].dueDate = Date()
    }
    
    
    
    // The array of games that will be used throughout the application
    var videoGameArray: [VideoGame] = [VideoGame(title: "Muppet Monster Mania", rating: "T", cover: UIImage(named: "MonsterAdventure.jpeg"), genre: "Horror", description: "It's like going to a haunted house, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Muppet Pinball Mayhem", rating: "G", cover: UIImage(named: "MuppetPinball.jpeg"), genre: "Horror", description: "It's like playing a pinball machine, but better because there are Muppets.", gameStatus: false), VideoGame(title: "Spy Muppets", rating: "G", cover: UIImage(named: "SpyMuppets.jpeg"), genre: "Horror", description: "It's like watching James Bond, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Race Mania", rating: "G", cover: UIImage(named: "Race.jpeg"), genre: "Horror", description: "It's like Mario Kart, but better because there are Muppets.", gameStatus: false), VideoGame(title: "Pigs in Space", rating: "G", cover: UIImage(named: "PigsInSpace.jpeg"), genre: "Horror", description: "It's like Lost in Space, but better because there are Muppets.", gameStatus: true)]
    
    
    // Function to get the number of games we have
    func getGameCount() -> Int {
        return videoGameArray.count
    }
    
    
    // Function to return a game at a specific index
    func getGameIndex(at index: Int) -> VideoGame {
        return videoGameArray[index]
    }
    

    // Function to add a game to the library
    func addGame(game: VideoGame) {
        
        videoGameArray.append(game)
        
        
        
    }
    
    // Function to delete a game from the library
    
    
    
    // Function to edit a game in the library
    
    
    
    
    
}




