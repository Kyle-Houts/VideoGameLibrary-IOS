//
//  EditGameViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/18/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var gameToEdit: VideoGame!
    
    
    @IBOutlet weak var editGameTitle: UITextField!
    
    
    @IBOutlet weak var editGameRating: UISegmentedControl!
    
    
    @IBOutlet weak var editGameGenre: UIPickerView!
    
    
    @IBOutlet weak var editGameDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editGameTitle.text = gameToEdit.title
        
        editGameDescription.text = gameToEdit.description
        
        // Set rating
        if gameToEdit.rating == "Everyone" {
            editGameRating.selectedSegmentIndex = 0
        } else if gameToEdit.rating == "10+" {
            editGameRating.selectedSegmentIndex = 1
        } else if gameToEdit.rating == "Teen" {
            editGameRating.selectedSegmentIndex = 2
        } else if gameToEdit.rating == "M" {
            editGameRating.selectedSegmentIndex = 3
        } else if gameToEdit.rating == "18+" {
            editGameRating.selectedSegmentIndex = 4
        }
        
        
        
        
        
        
        // Set to gameToEdit's genre
        if gameToEdit.genre == "Action" {
            editGameGenre.selectRow(0, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "RPG" {
            editGameGenre.selectRow(1, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "Platformer" {
            editGameGenre.selectRow(2, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "Survival" {
            editGameGenre.selectRow(3, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "Shooter" {
            editGameGenre.selectRow(4, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "Puzzle" {
            editGameGenre.selectRow(5, inComponent: 0, animated: false)
        } else if gameToEdit.genre == "Muppet" {
            editGameGenre.selectRow(6, inComponent: 0, animated: false)
        }
    }
    
    
    
    
    // Array holding the different genres our games can have
    let genreArray = ["Action", "RPG", "Platformer", "Survival", "Shooter", "Puzzle", "Muppet"]
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreArray[row]
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBAction func menuButtonTapped(_ sender: Any) {
         self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "undwindToLibrary", sender: self)
    }
    
    
    
    
    @IBAction func editGameButtonTapped(_ sender: Any) {

        gameToEdit.title =  editGameTitle.text!
    }
    
    
    
    
}
