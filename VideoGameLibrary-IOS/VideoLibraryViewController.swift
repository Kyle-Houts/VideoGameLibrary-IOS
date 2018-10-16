//
//  VideoLibraryViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class VideoLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    

    var videoGameArray: [VideoGame] = [VideoGame(title: "Muppet Monster Mania", rating: "G", cover: UIImage(named: "MonsterAdventure.jpeg"), genre: "Horror", description: "It's like going to a haunted house, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Muppet Pinball Mayhem", rating: "G", cover: UIImage(named: "MuppetPinball.jpeg"), genre: "Horror", description: "It's like playing a pinball machine, but better because there are Muppets.", gameStatus: false), VideoGame(title: "Spy Muppets", rating: "G", cover: UIImage(named: "SpyMuppets.jpeg"), genre: "Horror", description: "It's like watching James Bond, but better because there are Muppets.", gameStatus: true), VideoGame(title: "Race Mania", rating: "G", cover: UIImage(named: "Race.jpeg"), genre: "Horror", description: "It's like Mario Kart, but better because there are Muppets.", gameStatus: false), VideoGame(title: "Pigs in Space", rating: "G", cover: UIImage(named: "PigsInSpace.jpeg"), genre: "Horror", description: "It's like Lost in Space, but better because there are Muppets.", gameStatus: true)]
    
    
    
    // Sets number of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoGameArray.count
    }
    
    


    
    

    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell") as! VideoGameTableViewCell
        
        let gameAtIndex = videoGameArray[indexPath.row]
        
        cell.videoGameTitle?.text = "\(gameAtIndex.title)"
        
        cell.videoGameRating?.text = "\(gameAtIndex.rating)"
        
        cell.videoGameImage?.image = gameAtIndex.cover
        
        cell.gameGenre?.text = "\(gameAtIndex.genre)"
        
        cell.gameDescription?.text = "\(gameAtIndex.description)"
        
        if  gameAtIndex.gameStatus == true {
            cell.gameStatusImage?.image = UIImage(named: "CheckedIn.jpeg")
        } else {
            cell.gameStatusImage?.image = UIImage(named: "CheckedOut.jpeg")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    

}





