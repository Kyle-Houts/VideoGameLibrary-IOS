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
        
    }
    
    
    
    // The array of games that will be used throughout the application
    var videoGameArray: [VideoGame] = [VideoGame(title: "Muppet Monster Mania", rating: "Teen", cover: UIImage(named: "MonsterAdventure.jpeg"), genre: "RPG", description: "It's like going to a haunted house, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Muppet Pinball Mayhem", rating: "10+", cover: UIImage(named: "MuppetPinball.jpeg"), genre: "Puzzle", description: "It's like playing a pinball machine, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Spy Muppets", rating: "M", cover: UIImage(named: "SpyMuppets.jpeg"), genre: "Survival", description: "It's like watching James Bond, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Race Mania", rating: "18+", cover: UIImage(named: "Race.jpeg"), genre: "Muppet", description: "It's like Mario Kart, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Pigs in Space", rating: "Teen", cover: UIImage(named: "PigsInSpace.jpeg"), genre: "Shooter", description: "It's like Lost in Space, but better because there are Muppets.", gameStatus: true)]
    
    
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
    func removeGame(at index: Int) {
        
        videoGameArray.remove(at: index)
        
    }
    
    
    // Function to check game in or out
    func checkGameInOrOut(at index: Int) {
        
        let gameForIndex = videoGameArray[index]
        
        gameForIndex.gameStatus = !gameForIndex.gameStatus
        
        if gameForIndex.gameStatus {
            
            // Remove any existing due date
            gameForIndex.dueDate = nil
            
        } else {
            
            // Add a new due date, since the game has just been checked out
            gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            
        }
        
        
    }
    
    
//    // Function to edit a game in the library
//    
//    func editGame(game: VideoGame){
//
//       GameManager.sharedInstance.removeGame(at: videoGameArray[index])
//
//        GameManager.sharedInstance
//
//        
//        
//    }
    
}




