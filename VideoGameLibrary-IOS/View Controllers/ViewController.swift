//
//  ViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let settingsOptionsArray = ["Show all games", "Show available games", "Show checked out games", "Add game", "Edit game", "Delete game"]
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsOptionsArray.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoGameTableViewCell
        
        cell.menuSetting?.text = settingsOptionsArray[indexPath.row]
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        
        case 0:
            // Show all games
            self.performSegue(withIdentifier: "showGameList", sender: self)
            
        case 1:
            // Show available games
            self.performSegue(withIdentifier: "showGameList", sender: self)
        
        case 2:
            // Show checked out games
            self.performSegue(withIdentifier: "showGameList", sender: self)
           
        case 3:
            //Add game
            self.performSegue(withIdentifier: "showAddScreen", sender: self)
            
            
        default:
            print("Unprepared index")
        }
    }
    
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
    @IBAction func showAvailableGames(segue: UIStoryboardSegue) {}
    
}




