//
//  Equipment.swift
//  DS3
//
//  Created by Tom Clifford on 05/04/2021.
//

import Foundation


/// - Class to represent a piece of equipment, subclasses are `Weapon` & `Armour`.
/// I had wanted to have this inherit from `Item` but ran into issues with the second layer
/// of subclassing, so unfortunately some values are repeated
class Equipment: Codable
{
    
    let Name: String
    let Description: String
    let Location: String
    let Weight: Float
    let Durability: Int
    
    init(name: String, description: String, location: String, weight: Float, durability: Int)
    {
        self.Name = name
        self.Description = description
        self.Location = location
        self.Weight = weight
        self.Durability = durability
        
    }
}
