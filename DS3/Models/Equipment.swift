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
class Equipment: Codable, Identifiable
{
    
    let Name: String
    let Description: String
    let Location: String
    let Weight: Float
    let Durability: Int
    let ImageKey: String
    
    init(name: String, description: String, location: String, weight: Float, durability: Int, imageKey: String)
    {
        self.Name = name
        self.Description = description
        self.Location = location
        self.Weight = weight
        self.Durability = durability
        self.ImageKey = imageKey
        
    }
    
//    required init(from decoder: Decoder) throws
//    {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.Name = try container.decode(String.self, forKey: .Name)
//        self.Description = try container.decode(String.self, forKey: .Description)
//        self.Location = try container.decode(String.self, forKey: .Location)
//        self.Weight = try container.decode(Float.self, forKey: .Weight)
//        self.Durability = try container.decode(Int.self, forKey: .Durability)
//
//    }
    
    private enum CodingKeys: String, CodingKey
    {
        case Name
        case Description
        case Location
        case Weight
        case Durability
        case ImageKey
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Name, forKey: .Name)
        try container.encode(Description, forKey: .Description)
        try container.encode(Location, forKey: .Location)
        try container.encode(Weight, forKey: .Weight)
        try container.encode(Durability, forKey: .Durability)
        try container.encode(ImageKey, forKey: .ImageKey)
    }
    
    
}
