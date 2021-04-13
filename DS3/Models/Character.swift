//
//  Character.swift
//  DS3
//
//  Created by Tom Clifford on 10/04/2021.
//

import Foundation

class Character: Codable
{
    let Name: String
    @Published var CharClass: CharacterClass
    @Published var Level: Int
    var Attributes: Attributes
    let RightHand1: Weapon?
    let RightHand2: Weapon?
    let RightHand3: Weapon?
    let LeftHand1: Weapon?
    let LeftHand2: Weapon?
    let LeftHand3: Weapon?
    let Head: Armour?
    let Arms: Armour?
    let Body: Armour?
    let Legs: Armour?
    
    init(name: String, charClass: CharacterClass, rh1: Weapon?, rh2: Weapon?, rh3: Weapon?, lh1: Weapon?, lh2: Weapon?, lh3: Weapon?, head: Armour?, arms: Armour?, body: Armour?, legs: Armour?)
    {
        self.Name = name
        self.CharClass = charClass
        self.RightHand1 = rh1
        self.RightHand2 = rh2
        self.RightHand3 = rh3
        self.LeftHand1 = lh1
        self.LeftHand2 = lh2
        self.LeftHand3 = lh3
        self.Head = head
        self.Arms = arms
        self.Body = body
        self.Legs = legs
        let baseAttributes = Character.ReturnBaseAttributeDict(charClass: charClass)
        self.Level = baseAttributes["Level"]!
        self.Attributes = DS3.Attributes(vigor: baseAttributes["Vgr"]!, attunement: baseAttributes["Att"]!, endurance: baseAttributes["End"]!, vitality: baseAttributes["Vit"]!, strength: baseAttributes["Str"]!, dexterity: baseAttributes["Dex"]!, intelligence: baseAttributes["Int"]!, faith: baseAttributes["Fth"]!, luck: baseAttributes["Luck"]!)
    }
    
    init()
    {
        self.Name = "name"
        self.CharClass = .Deprived
        self.RightHand1 = nil
        self.RightHand2 = nil
        self.RightHand3 = nil
        self.LeftHand1 = nil
        self.LeftHand2 = nil
        self.LeftHand3 = nil
        self.Head = nil
        self.Arms = nil
        self.Body = nil
        self.Legs = nil
        self.Level = 1
        self.Attributes = DS3.Attributes(vigor: 10, attunement: 10, endurance: 10, vitality: 10, strength: 10, dexterity: 10, intelligence: 10, faith: 10, luck: 10)
    }
    
    private enum CodingKeys: String, CodingKey
    {
        case Name
        case CharClass
        case Level
        case Attributes
        case RightHand1
        case RightHand2
        case RightHand3
        case LeftHand1
        case LeftHand2
        case LeftHand3
        case Head
        case Arms
        case Body
        case Legs
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Name, forKey: .Name)
        try container.encode(CharClass, forKey: .CharClass)
        try container.encode(Level, forKey: .Level)
        try container.encode(Attributes, forKey: .Attributes)
        try container.encode(RightHand1, forKey: .RightHand1)
        try container.encode(RightHand2, forKey: .RightHand2)
        try container.encode(RightHand3, forKey: .RightHand3)
        try container.encode(LeftHand1, forKey: .LeftHand1)
        try container.encode(LeftHand2, forKey: .LeftHand2)
        try container.encode(LeftHand3, forKey: .LeftHand3)
        try container.encode(Head, forKey: .Head)
        try container.encode(Arms, forKey: .Arms)
        try container.encode(Body, forKey: .Body)
        try container.encode(Legs, forKey: .Legs)
    }
    
    func encode() -> String
    {
        let encoder = JSONEncoder()
        
        encoder.outputFormatting = .prettyPrinted
        
        let data = try! encoder.encode(self)
        
        print(String(data: data, encoding: .utf8)!)
        
        return String(data: data, encoding: .utf8)!
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.Name = try container.decode(String.self, forKey: .Name)
        self.CharClass = try container.decode(CharacterClass.self, forKey: .CharClass)
        self.Level = try container.decode(Int.self, forKey: .Level)
        self.Attributes = try container.decode(DS3.Attributes.self, forKey: .Attributes)
        self.RightHand1 = try container.decode(Weapon?.self, forKey: .RightHand1)
        self.RightHand2 = try container.decode(Weapon?.self, forKey: .RightHand2)
        self.RightHand3 = try container.decode(Weapon?.self, forKey: .RightHand3)
        self.LeftHand1 = try container.decode(Weapon?.self, forKey: .LeftHand1)
        self.LeftHand2 = try container.decode(Weapon?.self, forKey: .LeftHand2)
        self.LeftHand3 = try container.decode(Weapon?.self, forKey: .LeftHand3)
        self.Head = try container.decode(Armour?.self, forKey: .Head)
        self.Body = try container.decode(Armour?.self, forKey: .Body)
        self.Arms = try container.decode(Armour?.self, forKey: .Arms)
        self.Legs = try container.decode(Armour?.self, forKey: .Legs)
    }
}

extension Character
{
    enum CharacterClass: String, Codable, CaseIterable, Identifiable
    {
        case Knight = "Knight"
        case Mercenary = "Mercenary"
        case Warrior = "Warrior"
        case Herald = "Herald"
        case Thief = "Thief"
        case Assassin = "Assassin"
        case Sorcerer = "Sorcerer"
        case Pyromancer = "Pyromancer"
        case Cleric = "Cleric"
        case Deprived = "Deprived"
        
        var id: String { self.rawValue }
    }
    
    static func ReturnBaseAttributeDict(charClass: CharacterClass) -> Dictionary<String, Int>
    {
        switch charClass {
        case .Knight:
            return ["Level": 9,
                    "Vgr": 12,
                    "Att": 10,
                    "End": 11,
                    "Vit": 15,
                    "Str": 13,
                    "Dex": 12,
                    "Int": 9,
                    "Fth": 9,
                    "Luck": 7]
        case CharacterClass.Mercenary:
            return ["Level": 8,
                    "Vgr": 11,
                    "Att": 12,
                    "End": 11,
                    "Vit": 10,
                    "Str": 10,
                    "Dex": 16,
                    "Int": 10,
                    "Fth": 8,
                    "Luck": 9]
        case CharacterClass.Warrior:
            return ["Level": 7,
                    "Vgr": 14,
                    "Att": 6,
                    "End": 12,
                    "Vit": 11,
                    "Str": 16,
                    "Dex": 9,
                    "Int": 8,
                    "Fth": 9,
                    "Luck": 11]
        case CharacterClass.Herald:
            return ["Level": 9,
                    "Vgr": 12,
                    "Att": 10,
                    "End": 9,
                    "Vit": 12,
                    "Str": 12,
                    "Dex": 11,
                    "Int": 8,
                    "Fth": 13,
                    "Luck": 11]
        case CharacterClass.Thief:
            return ["Level": 5,
                    "Vgr": 10,
                    "Att": 11,
                    "End": 10,
                    "Vit": 9,
                    "Str": 9,
                    "Dex": 13,
                    "Int": 10,
                    "Fth": 8,
                    "Luck": 14]
        case CharacterClass.Assassin:
            return ["Level": 10,
                    "Vgr": 10,
                    "Att": 14,
                    "End": 11,
                    "Vit": 10,
                    "Str": 10,
                    "Dex": 14,
                    "Int": 11,
                    "Fth": 9,
                    "Luck": 10]
        case CharacterClass.Sorcerer:
            return ["Level": 6,
                    "Vgr": 9,
                    "Att": 16,
                    "End": 9,
                    "Vit": 7,
                    "Str": 7,
                    "Dex": 12,
                    "Int": 16,
                    "Fth": 7,
                    "Luck": 12]
        case CharacterClass.Pyromancer:
            return ["Level": 8,
                    "Vgr": 11,
                    "Att": 12,
                    "End": 10,
                    "Vit": 8,
                    "Str": 12,
                    "Dex": 9,
                    "Int": 14,
                    "Fth": 14,
                    "Luck": 7]
        case CharacterClass.Cleric:
            return ["Level": 7,
                    "Vgr": 10,
                    "Att": 14,
                    "End": 9,
                    "Vit": 7,
                    "Str": 12,
                    "Dex": 8,
                    "Int": 7,
                    "Fth": 16,
                    "Luck": 13]
        case CharacterClass.Deprived:
            return ["Level": 1,
                    "Vgr": 10,
                    "Att": 10,
                    "End": 10,
                    "Vit": 10,
                    "Str": 10,
                    "Dex": 10,
                    "Int": 10,
                    "Fth": 10,
                    "Luck": 10]
        }
    }
}
