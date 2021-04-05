//
//  Weapon.swift
//  DS3
//
//  Created by Tom Clifford on 05/04/2021.
//

import Foundation

final class Weapon : Equipment
{
    let PhysAtk: Int
    let MagAtk: Int
    let FireAtk: Int
    let LightningAtk: Int
    let DarkAtk: Int
    let Critical: Int
    let PhysDef: Int
    let MagDef: Int
    let FireDef: Int
    let LightningDef: Int
    let DarkDef: Int
    let Stability: Int
    let Bleed: Int
    let Poison: Int
    let Frost: Int
    let DmgType: [String]
    let Ability: Skill
    let FPCost: Int
    let ImageKey: String
    
    init(name: String, description: String, location: String, weight: Float, durability: Int, physAtk: Int, magAtk: Int, fireAtk: Int, lightningAtk: Int, darkAtk: Int, critical: Int, physDef: Int, magDef: Int, fireDef: Int, lightningDef: Int, darkDef: Int, stability: Int, bleed: Int, poison: Int, frost: Int, dmgType: [String], ability: Skill, fpCost: Int, imagekey: String)
    {
        self.PhysAtk = physAtk
        self.MagAtk = magAtk
        self.FireAtk = fireAtk
        self.LightningAtk = lightningAtk
        self.DarkAtk = darkAtk
        self.Critical = critical
        self.PhysDef = physDef
        self.MagDef = magDef
        self.FireDef = fireDef
        self.LightningDef = lightningDef
        self.DarkDef = darkDef
        self.Stability = stability
        self.Bleed = bleed
        self.Poison = poison
        self.Frost = frost
        self.DmgType = dmgType
        self.Ability = ability
        self.FPCost = fpCost
        self.ImageKey = imagekey
        super.init(name: name, description: description, location: location, weight: weight, durability: durability)
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.PhysAtk = try container.decode(Int.self, forKey: .PhysAtk)
        self.MagAtk = try container.decode(Int.self, forKey: .MagAtk)
        self.FireAtk = try container.decode(Int.self, forKey: .FireAtk)
        self.LightningAtk = try container.decode(Int.self, forKey: .LightningAtk)
        self.DarkAtk = try container.decode(Int.self, forKey: .DarkAtk)
        self.Critical = try container.decode(Int.self, forKey: .Critical)
        self.PhysDef = try container.decode(Int.self, forKey: .PhysDef)
        self.MagDef = try container.decode(Int.self, forKey: .MagDef)
        self.FireDef = try container.decode(Int.self, forKey: .FireDef)
        self.LightningDef = try container.decode(Int.self, forKey: .LightningDef)
        self.DarkDef = try container.decode(Int.self, forKey: .DarkDef)
        self.Stability = try container.decode(Int.self, forKey: .Stability)
        self.Bleed = try container.decode(Int.self, forKey: .Bleed)
        self.Poison = try container.decode(Int.self, forKey: .Poison)
        self.Frost = try container.decode(Int.self, forKey: .Frost)
        self.DmgType = try container.decode([String].self, forKey: .DmgType)
        self.Ability = try container.decode(Skill.self, forKey: .Ability)
        self.FPCost = try container.decode(Int.self, forKey: .FPCost)
        self.ImageKey = try container.decode(String.self, forKey: .ImageKey)
        try super.init(from: decoder)
    }
    
    private enum CodingKeys: String, CodingKey
    {
        case PhysAtk
        case MagAtk
        case FireAtk
        case LightningAtk
        case DarkAtk
        case Critical
        case PhysDef
        case MagDef
        case FireDef
        case LightningDef
        case DarkDef
        case Stability
        case Bleed
        case Poison
        case Frost
        case DmgType
        case Ability
        case FPCost
        case ImageKey
    }
    
    func encode() -> String
    {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try! encoder.encode(self)
        
        print(String(data: data, encoding: .utf8)!)
        
        return String(data: data, encoding: .utf8)!
    }
}

extension Weapon {
    enum DamageType: String
    {
        case Standard = "Standard"
        case Strike = "Strike"
        case Thrust = "Thrust"
        case Slash = "Slash"
    }
}
