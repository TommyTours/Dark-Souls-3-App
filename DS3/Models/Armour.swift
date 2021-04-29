//
//  Armour.swift
//  DS3
//
//  Created by Tom Clifford on 10/04/2021.
//

import Foundation

final class Armour: Equipment, Hashable
{
    static func == (lhs: Armour, rhs: Armour) -> Bool {
        lhs.Name == rhs.Name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(Name)
    }
    
    let PhysDef: Double
    let StrikeDef: Double
    let SlashDef: Double
    let ThrustDef: Double
    let MagicDef: Double
    let FireDef: Double
    let LightningDef: Double
    let DarkDef: Double
    let BleedRes: Int
    let PoisonRes: Int
    let FrostRes: Int
    let CurseRes: Int
    let Poise: Double
    let Position: ArmourPosition.RawValue
    
    init(physDef: Double, strikeDef: Double, slashDef: Double, thrustDef: Double, magicDef: Double, fireDef: Double, lightningDef: Double, darkDef: Double, bleedRes: Int, poisonRes: Int, frostRes: Int, curseRes: Int, poise: Double, name: String, description: String, location: String, weight: Float, durability: Int, imageKey: String, position: ArmourPosition)
    {
        self.PhysDef = physDef
        self.StrikeDef = strikeDef
        self.SlashDef = slashDef
        self.ThrustDef = thrustDef
        self.MagicDef = magicDef
        self.FireDef = fireDef
        self.LightningDef = lightningDef
        self.DarkDef = darkDef
        self.BleedRes = bleedRes
        self.PoisonRes = poisonRes
        self.FrostRes = frostRes
        self.CurseRes = curseRes
        self.Poise = poise
        self.Position = position.rawValue
        super.init(name: name, description: description, location: location, weight: weight, durability: durability, imageKey: imageKey)
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.PhysDef = try container.decode(Double.self, forKey: .PhysDef)
        self.StrikeDef = try container.decode(Double.self, forKey: .StrikeDef)
        self.SlashDef = try container.decode(Double.self, forKey: .SlashDef)
        self.ThrustDef = try container.decode(Double.self, forKey: .ThrustDef)
        self.MagicDef = try container.decode(Double.self, forKey: .MagicDef)
        self.FireDef = try container.decode(Double.self, forKey: .FireDef)
        self.LightningDef = try container.decode(Double.self, forKey: .LightningDef)
        self.DarkDef = try container.decode(Double.self, forKey: .DarkDef)
        self.BleedRes = try container.decode(Int.self, forKey: .BleedRes)
        self.PoisonRes = try container.decode(Int.self, forKey: .PoisonRes)
        self.FrostRes = try container.decode(Int.self, forKey: .FrostRes)
        self.CurseRes = try container.decode(Int.self, forKey: .CurseRes)
        self.Poise = try container.decode(Double.self, forKey: .Poise)
        self.Position = try container.decode(String.self, forKey: .Position)
        
        let superDecoder = try container.superDecoder(forKey: .Equipment)
        try super.init(from: superDecoder)
    }
    
    // Method used to encode class to JSON
    override public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(PhysDef, forKey: .PhysDef)
        try container.encode(StrikeDef, forKey: .StrikeDef)
        try container.encode(SlashDef, forKey: .SlashDef)
        try container.encode(ThrustDef, forKey: .ThrustDef)
        try container.encode(MagicDef, forKey: .MagicDef)
        try container.encode(FireDef, forKey: .FireDef)
        try container.encode(LightningDef, forKey: .LightningDef)
        try container.encode(DarkDef, forKey: .DarkDef)
        try container.encode(BleedRes, forKey: .BleedRes)
        try container.encode(PoisonRes, forKey: .PoisonRes)
        try container.encode(FrostRes, forKey: .FrostRes)
        try container.encode(CurseRes, forKey: .CurseRes)
        try container.encode(Poise, forKey: .Poise)
        try container.encode(Position, forKey: .Position)
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
    
    private enum CodingKeys: String, CodingKey
    {
        case PhysDef
        case StrikeDef
        case SlashDef
        case ThrustDef
        case MagicDef
        case FireDef
        case LightningDef
        case DarkDef
        case BleedRes
        case PoisonRes
        case FrostRes
        case CurseRes
        case Poise
        case Equipment
        case Position
    }
    
    enum ArmourPosition: String
    {
        case Head = "Head"
        case Body = "Body"
        case Arms = "Arms"
        case Legs = "Legs"
    }
}
