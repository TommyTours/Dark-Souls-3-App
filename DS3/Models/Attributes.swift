//
//  File.swift
//  DS3
//
//  Created by Tom Clifford on 13/04/2021.
//

import Foundation

class Attributes: Codable
{
    var Vigor: Int
    var Attunement: Int
    var Endurance: Int
    var Vitality: Int
    var Strength: Int
    var Dexterity: Int
    var Intelligence: Int
    var Faith: Int
    var Luck: Int
    
    init(vigor: Int, attunement: Int, endurance: Int, vitality: Int, strength: Int, dexterity: Int, intelligence: Int, faith: Int, luck: Int)
    {
        self.Vigor = vigor
        self.Attunement = attunement
        self.Endurance = endurance
        self.Vitality = vitality
        self.Strength = strength
        self.Dexterity = dexterity
        self.Intelligence = intelligence
        self.Faith = faith
        self.Luck = luck
    }
    
    init(charClass: Character.CharacterClass)
    {
        switch charClass {
        case .Knight:
            self.Vigor = 12
            self.Attunement = 10
            self.Endurance = 11
            self.Vitality = 15
            self.Strength = 13
            self.Dexterity = 12
            self.Intelligence = 9
            self.Faith = 9
            self.Luck = 7
        case .Mercenary:
            self.Vigor = 11
            self.Attunement = 12
            self.Endurance = 11
            self.Vitality = 10
            self.Strength = 10
            self.Dexterity = 16
            self.Intelligence = 10
            self.Faith = 8
            self.Luck = 9
        case .Warrior:
            self.Vigor = 14
            self.Attunement = 6
            self.Endurance = 12
            self.Vitality = 11
            self.Strength = 16
            self.Dexterity = 9
            self.Intelligence = 8
            self.Faith = 9
            self.Luck = 11
        case .Herald:
            self.Vigor = 12
            self.Attunement = 10
            self.Endurance = 9
            self.Vitality = 12
            self.Strength = 12
            self.Dexterity = 11
            self.Intelligence = 8
            self.Faith = 13
            self.Luck = 11
        case .Thief:
            self.Vigor = 10
            self.Attunement = 11
            self.Endurance = 10
            self.Vitality = 9
            self.Strength = 9
            self.Dexterity = 13
            self.Intelligence = 10
            self.Faith = 8
            self.Luck = 14
        case .Assassin:
            self.Vigor = 10
            self.Attunement = 14
            self.Endurance = 11
            self.Vitality = 10
            self.Strength = 10
            self.Dexterity = 14
            self.Intelligence = 11
            self.Faith = 9
            self.Luck = 10
        case .Sorcerer:
            self.Vigor = 9
            self.Attunement = 16
            self.Endurance = 9
            self.Vitality = 7
            self.Strength = 7
            self.Dexterity = 12
            self.Intelligence = 16
            self.Faith = 7
            self.Luck = 12
        case .Pyromancer:
            self.Vigor = 11
            self.Attunement = 12
            self.Endurance = 10
            self.Vitality = 8
            self.Strength = 12
            self.Dexterity = 9
            self.Intelligence = 14
            self.Faith = 14
            self.Luck = 7
        case .Cleric:
            self.Vigor = 10
            self.Attunement = 14
            self.Endurance = 9
            self.Vitality = 7
            self.Strength = 12
            self.Dexterity = 8
            self.Intelligence = 7
            self.Faith = 16
            self.Luck = 13
        case .Deprived:
            self.Vigor = 10
            self.Attunement = 10
            self.Endurance = 10
            self.Vitality = 10
            self.Strength = 10
            self.Dexterity = 10
            self.Intelligence = 10
            self.Faith = 10
            self.Luck = 10
        }
    }
    
    public func encode(to encoder: Encoder) throws
    {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Vigor, forKey: .Vigor)
        try container.encode(Attunement, forKey: .Attunement)
        try container.encode(Endurance, forKey: .Endurance)
        try container.encode(Vitality, forKey: .Vitality)
        try container.encode(Strength, forKey: .Strength)
        try container.encode(Dexterity, forKey: .Dexterity)
        try container.encode(Intelligence, forKey: .Intelligence)
        try container.encode(Faith, forKey: .Faith)
        try container.encode(Luck, forKey: .Luck)
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.Vigor = try container.decode(Int.self, forKey: .Vigor)
        self.Attunement = try container.decode(Int.self, forKey: .Attunement)
        self.Endurance = try container.decode(Int.self, forKey: .Endurance)
        self.Vitality = try container.decode(Int.self, forKey: .Vitality)
        self.Strength = try container.decode(Int.self, forKey: .Strength)
        self.Dexterity = try container.decode(Int.self, forKey: .Dexterity)
        self.Intelligence = try container.decode(Int.self, forKey: .Intelligence)
        self.Faith = try container.decode(Int.self, forKey: .Faith)
        self.Luck = try container.decode(Int.self, forKey: .Luck)
    }
    
    private enum CodingKeys: String, CodingKey
    {
        case Vigor
        case Attunement
        case Endurance
        case Vitality
        case Strength
        case Dexterity
        case Intelligence
        case Faith
        case Luck
    }
}
