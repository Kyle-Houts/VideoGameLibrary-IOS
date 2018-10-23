//
//  EditGameViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/18/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var gameToEdit: VideoGame!
    
    
    @IBOutlet weak var editGameTitle: UITextField!
    
    
    @IBOutlet weak var editGameRating: UISegmentedControl!
    
    
    @IBOutlet weak var editGameGenre: UIPickerView!
    
    
    @IBOutlet weak var editGameDescription: UITextView!
    
    // Lets user choose photo for game cover when adding a game
    var imagePicker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()    
        imagePicker.delegate = self
        
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
    
    var selectedImage: UIImage?
    
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
        self.performSegue(withIdentifier: "unwindToLibrary", sender: self)
    }
    
    
    // Shows an error when all fields are not filled in when editing a game
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "You must enter in all fields to submit", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.editGameTitle.text = ""
            self.editGameDescription.text = ""
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    @IBAction func editGameImageButtonTapped(_ sender: Any) {
        
        // Shows alert if title and description are blank
        guard let title = editGameTitle.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = editGameDescription.text, gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                // Show an error and return
                showErrorAlert()
                return
        }
        
        
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            alert.popoverPresentationController?.sourceView = sender as? UIView
            alert.popoverPresentationController?.sourceRect = (sender as AnyObject).bounds
            alert.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have a camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func editGameButtonTapped(_ sender: Any) {
        
        
        
        gameToEdit.title =  editGameTitle.text!
        gameToEdit.description = editGameDescription.text!
        gameToEdit.genre = genreArray[editGameGenre.selectedRow(inComponent: 0)]
        var rating: String?
        switch editGameRating.selectedSegmentIndex {
            
        case 0:
            rating = "Everyone"
            
        case 1:
            rating = "10+"
            
        case 2:
            rating = "Teen"
            
        case 3:
            rating = "M"
            
        case 4:
            rating = "18+"
            
        default:
            rating = "E"
        }
        
//        gameToEdit.rating = editGameRating.selectedSegmentIndex
        
        
//        let genre = genreArray[editGameGenre.selectedRow(inComponent: 0)]
      
        
        if let image = selectedImage {
            let editedGame = VideoGame(title: gameToEdit.title, rating: rating!, cover: gameToEdit.cover, genre: gameToEdit.genre, description: gameToEdit.description, gameStatus: true)
//            GameManager.sharedInstance.addGame(game: editedGame)
        } else {
            let editedGame = VideoGame(title: gameToEdit.title, rating: rating!, cover: nil, genre: gameToEdit.genre, description: gameToEdit.description, gameStatus: true)
//            GameManager.sharedInstance.addGame(game: editedGame)
        }
//
//        // Remove the game at the current index from the game array
//        GameManager.sharedInstance.removeGame(at: indexPath.row)
        
        
        // Goes back to VideoLibraryViewController
        self.performSegue(withIdentifier: "unwindToLibrary", sender: self)
        
    }
    
    
    
    
}
