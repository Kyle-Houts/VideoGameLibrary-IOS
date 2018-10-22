//
//  AddGameViewController.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/16/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
    
    
    @IBOutlet weak var addGameDescription: UITextView!
    
    
    @IBOutlet weak var genrePickerView: UIPickerView!
    
    
    // Array holding the different genres our games can have
    let genreArray = ["Action", "RPG", "Platformer", "Survival", "Shooter", "Puzzle", "Muppet"]
    
    
    var selectedImage: UIImage?
    
    
    
    // Sets number of cells in the genre tableView to the number in the genreArray
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreArray.count
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreArray[row]
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    // Shows an error when all fields are not filled in when adding a game
    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "You must enter in all fields to submit", preferredStyle: .actionSheet)
        
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
            self.addGameTitle.text = ""
            self.addGameDescription.text = ""
        }
        
        alertController.addAction(closeAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    // Adds new game to array if all fields are filled out
    @IBAction func addGameButtonTapped(_ sender: Any) {
        
        // Shows alart if title and description are blank
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
        
        if let image = selectedImage {
            let newGame = VideoGame(title: title, rating: rating, cover: image, genre: genre, description: description!, gameStatus: true)
            GameManager.sharedInstance.addGame(game: newGame)
        } else {
            let newGame = VideoGame(title: title, rating: rating, cover: nil, genre: genre, description: description!, gameStatus: true)
            GameManager.sharedInstance.addGame(game: newGame)
        }
                
        self.performSegue(withIdentifier: "unwindToGameList", sender: self)
        
        
    }
    
    // Goes back to menu if menu button tapped
    @IBAction func menuButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    
    
    
    
    // Lets user choose photo for game cover when adding a game
    var imagePicker = UIImagePickerController()
    
    @IBAction func chooseGameImageButtonTapped(_ sender: Any) {
        
        
        
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
    
}
