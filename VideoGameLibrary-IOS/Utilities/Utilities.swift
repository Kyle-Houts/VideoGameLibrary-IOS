//
//  Utilities.swift
//  VideoGameLibrary-IOS
//
//  Created by Kyle Houts on 10/18/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation


// Date Formatter
func formatDate (_ date: Date) -> String {
    
    let formatter = DateFormatter()
    
    // dateFormatter.dateStyle = .meduium - This will allow you to set different default date styles
    
    formatter.dateFormat = "MM/dd/yy"
    
    let formattedString = formatter.string(from: date)
    
    return formattedString
    
}
