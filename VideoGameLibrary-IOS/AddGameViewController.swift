//
//  AddGameViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/16/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var addGameTitle: UITextField!
    
    @IBOutlet weak var chooseGameRating: UISegmentedControl!
    
    @IBOutlet weak var addGameDiscription: UITextField!
    
    
    @IBOutlet weak var chooseGameGenre: UISegmentedControl!
    
    
    
    

}
