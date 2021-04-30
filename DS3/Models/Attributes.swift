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
    
    init(strength: Int, dexterity: Int, intelligence: Int, faith: Int)
    {
        self.Vigor = 0
        self.Attunement = 0
        self.Endurance = 0
        self.Vitality = 0
        self.Strength = strength
        self.Dexterity = dexterity
        self.Intelligence = intelligence
        self.Faith = faith
        self.Luck = 0
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
    
    static func getRequiredSouls(current: Int, required: Int) -> Int
    {
        let soulReqs = [0, 0, 673, 689, 706, 723, 740, 757, 775, 793, 811, 829, 847, 1038, 1238, 1445, 1659, 1882, 2113, 2353, 2601, 2857, 3122, 3395, 3678, 3969, 4270, 4580, 4899, 5228, 5566, 5915, 6272, 6640, 7018, 7407, 7805, 8214, 8633, 9064, 9505, 9956, 10419, 10893, 11379, 11876, 12384, 12904, 13435, 13979, 14535, 15102, 15682, 16274, 16879, 17497, 18127, 18770, 19425, 20094, 20776, 21472, 22181, 22903, 23640, 23390, 25153, 25931, 26723, 27530, 28351, 29186, 30036, 30900, 31780, 32675, 33584, 34509, 35449, 36405, 37377, 38364, 39376, 40385, 41420, 42472, 43539, 44623, 45723, 46841, 47975, 49125, 50293, 51478, 52681, 53901, 55138, 56393, 57665, 58956, 60265, 61591, 62936, 64299, 65681, 67082, 68501, 69939, 71395, 72871, 74367, 75881, 77415, 78968, 80542, 82134, 83747, 85380, 87033, 88707, 90400, 92115, 93850, 95605, 97382, 99179, 100998, 102838, 104699,  106582, 108486, 110413, 112360, 114330, 116322, 118337, 120373, 122432, 124513, 126618, 128744, 130894, 133067, 135263, 137483, 139725, 141992, 144282, 146595, 148933, 151292, 153680, 156090, 158524, 160983, 163466, 165957, 168507, 171065, 173648, 176257, 178890, 181549, 184233, 186944, 189679, 192441, 195229, 198043, 200884, 203750, 206644, 209564, 212510, 215484, 218485, 221512, 224567, 227649, 230759, 233896, 237062, 240254, 243475, 246724, 250002, 253307, 256641, 260003, 263395, 266815, 270263, 273741, 277248, 280785, 284350, 287946, 291571, 295225, 298910, 302625, 306369, 310114, 313949, 317785, 321651, 325549, 329476, 333435, 337425, 341447, 345499, 349583, 353698, 357846, 362025, 366235, 370478, 374653, 379061, 383400, 387773, 392178, 396615, 401086, 405589, 410126, 414696, 419299, 423936, 428607, 433311, 438049, 442820, 447626, 452467, 457341, 462250, 467193, 472172, 477185, 482232, 487315, 492433, 497587, 502775, 508000, 513260, 518555, 523887, 529254, 534658, 540098, 545574, 551087, 556636, 562223, 567846, 573505, 579202, 584937, 590708, 596517, 602363, 608248, 614170, 620129, 626127, 632163, 638238, 644351, 650502, 656692, 662920, 669188, 675494, 681840, 688225, 694649, 701113, 707616, 714160, 720743, 727365, 734028, 740732, 747475, 754259, 761083, 767949, 774855, 781801, 788789, 795818, 802889, 810000, 817154, 824349, 831585, 838864, 846184, 853547, 860952, 868399, 875889, 883421, 890997, 898615, 906275, 913979, 921727, 929517, 937351, 945228, 953150, 961115, 969123, 977176, 985273, 993415, 1001600]
        
        var requiredSouls = 0
        let inArray = required < (soulReqs.count - 1)
        let loopEnd = inArray ? required : soulReqs.count
        
        for i in current+1...loopEnd
        {
            requiredSouls += soulReqs[i]
        }
        // As exact level requirements are not known for higher levels, use average increase of 2.7% per level
        if !inArray
        {
            for _ in soulReqs.count...required
            {
                requiredSouls += Int((Double(requiredSouls) * 1.027).rounded())
            }
        }

        return requiredSouls
    }
}
