//
//  VideoGameTableViewCell.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/15/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import UIKit

class VideoGameTableViewCell: UITableViewCell {
    
    // Video Library View Controller
    @IBOutlet weak var videoGameTitle: UILabel!
    
    
    @IBOutlet weak var videoGameRating: UILabel!
    
    
    @IBOutlet weak var videoGameImage: UIImageView!
    
    
    @IBOutlet weak var gameGenre: UILabel!
    
    
    @IBOutlet weak var gameDescription: UILabel!
    
    
    @IBOutlet weak var gameStatusImage: UIImageView!

    
    @IBOutlet weak var gameDueDate: UILabel!
    
    
    
    
    
    
    // View Controller
    @IBOutlet weak var menuSetting: UILabel!
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
