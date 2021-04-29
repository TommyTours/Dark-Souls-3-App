//
//  ArmourList.swift
//  DS3
//
//  Created by Tom Clifford on 12/04/2021.
//

import Foundation

struct ArmourList
{
    var allArmours: [Armour] { ArmoursCache }
    var allHelms: [Armour] { ArmoursCache.filter{ armour in return armour.Position == Armour.ArmourPosition.Head.rawValue }}
    var allBodys: [Armour] { ArmoursCache.filter{ armour in return armour.Position == Armour.ArmourPosition.Body.rawValue }}
    var allArms: [Armour] { ArmoursCache.filter{ armour in return armour.Position == Armour.ArmourPosition.Arms.rawValue }}
    var allLegs: [Armour] { ArmoursCache.filter{ armour in return armour.Position == Armour.ArmourPosition.Legs.rawValue }}
    
    /// An in memory cache of Armours  that are persistently stored
    private var ArmoursCache: [Armour] = [
        .init(physDef: 0.0, strikeDef: 0.0, slashDef: 0.0, thrustDef: 0.0, magicDef: 0.0, fireDef: 0.0, lightningDef: 0.0, darkDef: 0.0, bleedRes: 0, poisonRes: 0, frostRes: 0, curseRes: 0, poise: 0.0, name: "None", description: "No Helm", location: "N/A", weight: 0.0, durability: 0, imageKey: "none", position: Armour.ArmourPosition.Head),
        .init(physDef: 0.0, strikeDef: 0.0, slashDef: 0.0, thrustDef: 0.0, magicDef: 0.0, fireDef: 0.0, lightningDef: 0.0, darkDef: 0.0, bleedRes: 0, poisonRes: 0, frostRes: 0, curseRes: 0, poise: 0.0, name: "None", description: "No Helm", location: "N/A", weight: 0.0, durability: 0, imageKey: "none", position: Armour.ArmourPosition.Body),
        .init(physDef: 0.0, strikeDef: 0.0, slashDef: 0.0, thrustDef: 0.0, magicDef: 0.0, fireDef: 0.0, lightningDef: 0.0, darkDef: 0.0, bleedRes: 0, poisonRes: 0, frostRes: 0, curseRes: 0, poise: 0.0, name: "None", description: "No Helm", location: "N/A", weight: 0.0, durability: 0, imageKey: "none", position: Armour.ArmourPosition.Arms),
        .init(physDef: 0.0, strikeDef: 0.0, slashDef: 0.0, thrustDef: 0.0, magicDef: 0.0, fireDef: 0.0, lightningDef: 0.0, darkDef: 0.0, bleedRes: 0, poisonRes: 0, frostRes: 0, curseRes: 0, poise: 0.0, name: "None", description: "No Helm", location: "N/A", weight: 0.0, durability: 0, imageKey: "none", position: Armour.ArmourPosition.Legs),
        .init(physDef: 4.4, strikeDef: 3.8, slashDef: 4.4, thrustDef: 4.4, magicDef: 3.0, fireDef: 4.2, lightningDef: 2.2, darkDef: 3.8, bleedRes: 23, poisonRes: 16, frostRes: 17, curseRes: 17, poise: 2.9, name: "Wolf Knight Helm", description: "Helm of a knight tainted by the dark of the Abyss. The twilight blue tassel is damp, and will ever remain so.\nA vanquished knight left behind only wolf's blood, and legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 10,000 Souls", weight: 4.2, durability: 360, imageKey: "arm_wolf_knight_helm", position: Armour.ArmourPosition.Head),
        .init(physDef: 11.7, strikeDef: 10.0, slashDef: 11.9, thrustDef: 11.7, magicDef: 7.8, fireDef: 11.2, lightningDef: 5.5, darkDef: 10.0, bleedRes: 46, poisonRes: 32, frostRes: 33, curseRes: 33, poise: 8.0, name: "Wolf Knight Armor", description: "Armor of a knight tainted by the dark of the Abyss. The twilight blue cape is damp, and will ever remain so.\nA vanquished knight left behind only wolf's blood, and his legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 16,000 Souls", weight: 9.0, durability: 360, imageKey: "arm_wolf_knight_armour", position: Armour.ArmourPosition.Body),
        .init(physDef: 3.2, strikeDef: 2.8, slashDef: 3.2, thrustDef: 3.2, magicDef: 2.0, fireDef: 3.1, lightningDef: 1.4, darkDef: 2.7, bleedRes: 18, poisonRes: 13, frostRes: 14, curseRes: 14, poise: 1.6, name: "Wolf Knight Gauntlets", description: "Gauntlets of a knight tainted by the dark of the Abyss.\nA vanquished knight left behind only wolf's blood, and his legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 16,000 Souls", weight: 3.1, durability: 360, imageKey: "arm_wolf_knight_gauntlets", position: Armour.ArmourPosition.Arms),
        .init(physDef: 6.7, strikeDef: 5.6, slashDef: 6.5, thrustDef: 6.7, magicDef: 4.2, fireDef: 6.4, lightningDef: 2.8, darkDef: 5.6, bleedRes: 25, poisonRes: 15, frostRes: 19, curseRes: 19, poise: 4.6, name: "Wolf Knight Leggings", description: "Leggings of a knight tainted by the dark of the Abyss.\nA vanquished knight left behind only wolf's blood, and his legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 16,000 Souls", weight: 5.1, durability: 350, imageKey: "arm_wolf_knight_leggings", position: Armour.ArmourPosition.Legs)
        
    ]
    
}
/// An in memory cache of Armours  that are persistently stored
//    @Published private var ArmoursCache: [Armour] =
//    (
//        try? JSONDecoder().decode(
//            [Armour].self, from: .init(contentsOf: .jsonURL)
//        )
//    ).filter { _ in !PreviewDevice.inXcode }
//    ??
//    [
//    ]
//}
//
//private extension URL
//{
//    static let jsonURL = Self(fileName: "Armours", extension: "json")
//
//    init(fileName: String, extension: String)
//    {
//        self = FileManager.`default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            .appendingPathComponent(fileName)
//            .appendingPathExtension(`extension`)
//    }
//}
