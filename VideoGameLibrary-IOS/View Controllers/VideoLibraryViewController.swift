//
//  VideoLibraryViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class VideoLibraryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var gameLibraryTableView: UITableView!
    

    override func viewDidLoad() {
        
            super.viewDidLoad()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        gameLibraryTableView.reloadData()
        
        
    }
    
    
    // Sets number of rows in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell") as! VideoGameTableViewCell
        
        let gameAtIndex = GameManager.sharedInstance.getGameIndex(at: indexPath.row)
        
        cell.videoGameTitle?.text = "\(gameAtIndex.title)"
        
        cell.videoGameRating?.text = "\(gameAtIndex.rating)"
        
        cell.videoGameImage?.image = gameAtIndex.cover
        
        cell.gameGenre?.text = "\(gameAtIndex.genre)"
        
        cell.gameDescription?.text = "\(gameAtIndex.description)"
        
        // If the game has a due date, we want to format it into a String and display it on the gameDueDate label
        if let dueDate = gameAtIndex.dueDate {
            cell.gameDueDate.text = formatDate(dueDate)
        } else {
            cell.gameDueDate.text = ""
        }
        
        
        
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // This allows us to return an array of actions that the row will have (if any)
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, _) in
            
            // Remove the game at the current index from the game array
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            // Delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGameIndex(at: indexPath.row)
        
        let title = gameForIndex.gameStatus ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        checkOutOrInAction.backgroundColor = UIColor.purple
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
        self.performSegue(withIdentifier: "showEditGameScreen", sender: self)
        }
        
        showEditScreenAction.backgroundColor = UIColor.magenta
        
        return [deleteAction, checkOutOrInAction, showEditScreenAction]
    }
    
    
    
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    

}





