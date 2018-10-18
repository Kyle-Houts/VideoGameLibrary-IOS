//
//  AddGameViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/16/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
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
    
    @IBOutlet weak var addGameDescription: UITextField!
    
    
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    
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
    
    
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "You must enter in all fields to submit", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.addGameTitle.text = ""
            self.addGameDescription.text = ""
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBAction func addGameButtonTapped(_ sender: Any) {
        
        
        guard let title = addGameTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = addGameDescription.text, gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                // Show an error and return
                showErrorAlert()
                return
        }
        
        var rating: String!
        
        switch chooseGameRating.selectedSegmentIndex {
            
        case 0:
            rating = "Everyone"
            
        case 1:
            rating = "10+"
            
        case 2:
            rating = "T"
            
        case 3:
            rating = "M"
            
        case 4:
            rating = "18+"
            
        default:
            rating = "E"
        }
        
        
        

        
        let genre = genreArray[genrePickerView.selectedRow(inComponent: 0)]
        
        let description = addGameDescription.text
        
        let newGame = VideoGame(title: title, rating: rating, cover: nil, genre: genre, description: description!, gameStatus: true)
        
        GameManager.sharedInstance.addGame(game: newGame)
        
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
        
        
    }
    
    
    
    
}
