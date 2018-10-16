//
//  ViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let settingsOptionsArray = ["Show all games", "Show available games", "Show checked out games", "Add game", "Delete game"]
    
    
    
    
    
    
    
    
    

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
    
    
    
    
    
    

}




