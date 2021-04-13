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
    let StrReq: Int
    let StrScale: String  // TODO: Work out encoding/decoding of enums without explicit typing
    let DexReq: Int
    let DexScale: String  // TODO: Work out encoding/decoding of enums without explicit typing
    let IntReq: Int
    let IntScale: String  // TODO: Work out encoding/decoding of enums without explicit typing
    let FthReq: Int
    let FthScale: String  // TODO: Work out encoding/decoding of enums without explicit typing
    
    init(name: String, description: String, location: String, weight: Float, durability: Int, imageKey: String, physAtk: Int, magAtk: Int, fireAtk: Int, lightningAtk: Int, darkAtk: Int, critical: Int, physDef: Int, magDef: Int, fireDef: Int, lightningDef: Int, darkDef: Int, stability: Int, bleed: Int, poison: Int, frost: Int, dmgType: [String], ability: Skill, fpCost: Int, strReq: Int, strScale: String, dexReq: Int, dexScale: String, intReq: Int, intScale: String, fthReq: Int, fthScale: String)
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
        self.StrReq = strReq
        self.StrScale = strScale
        self.DexReq = dexReq
        self.DexScale = dexScale
        self.IntReq = intReq
        self.IntScale = intScale
        self.FthReq = fthReq
        self.FthScale = fthScale
        super.init(name: name, description: description, location: location, weight: weight, durability: durability, imageKey: imageKey)
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
        self.StrReq = try container.decode(Int.self, forKey: .StrReq)
        self.StrScale = try container.decode(String.self, forKey: .StrScale)
        self.DexReq = try container.decode(Int.self, forKey: .DexReq)
        self.DexScale = try container.decode(String.self, forKey: .DexScale)
        self.IntReq = try container.decode(Int.self, forKey: .IntReq)
        self.IntScale = try container.decode(String.self, forKey: .IntScale)
        self.FthReq = try container.decode(Int.self, forKey: .FthReq)
        self.FthScale = try container.decode(String.self, forKey: .FthScale)
        
        let superDecoder = try container.superDecoder(forKey: .Equipment)
        try super.init(from: superDecoder)
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
        case StrReq
        case StrScale
        case DexReq
        case DexScale
        case IntReq
        case IntScale
        case FthReq
        case FthScale
        case Equipment
    }
    
    // Method used to encode class to JSON
    override public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(PhysAtk, forKey: .PhysAtk)
        try container.encode(MagAtk, forKey: .MagAtk)
        try container.encode(FireAtk, forKey: .FireAtk)
        try container.encode(LightningAtk, forKey: .LightningAtk)
        try container.encode(DarkAtk, forKey: .DarkAtk)
        try container.encode(Critical, forKey: .Critical)
        try container.encode(PhysDef, forKey: .PhysDef)
        try container.encode(MagDef, forKey: .MagDef)
        try container.encode(FireDef, forKey: .FireDef)
        try container.encode(LightningDef, forKey: .LightningDef)
        try container.encode(DarkDef, forKey: .DarkDef)
        try container.encode(Stability, forKey: .Stability)
        try container.encode(Bleed, forKey: .Bleed)
        try container.encode(Poison, forKey: .Poison)
        try container.encode(Frost, forKey: .Frost)
        try container.encode(DmgType, forKey: .DmgType)
        try container.encode(Ability, forKey: .Ability)
        try container.encode(FPCost, forKey: .FPCost)
        try container.encode(StrReq, forKey: .StrReq)
        try container.encode(StrScale, forKey: .StrScale)
        try container.encode(DexReq, forKey: .DexReq)
        try container.encode(DexScale, forKey: .DexScale)
        try container.encode(IntReq, forKey: .IntReq)
        try container.encode(IntScale, forKey: .IntScale)
        try container.encode(FthReq, forKey: .FthReq)
        try container.encode(FthScale, forKey: .FthScale)
        let superEncoder = container.superEncoder(forKey: .Equipment)
        try super.encode(to: superEncoder)
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
    
    enum Scaling: String
    {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
        case E = "E"
        case none = "-"
    }
}
