//
//  Item.swift
//  DS3
//
//  Created by Tom Clifford on 05/04/2021.
//

import Foundation

class Item
{
    let Name: String
    let Description: String
    let Location: String
    
    init(name: String, description: String, location: String)
    {
        self.Name = name
        self.Description = description
        self.Location = location 
    }
}
