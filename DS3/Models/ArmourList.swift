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
        .init(physDef: 6.7, strikeDef: 5.6, slashDef: 6.5, thrustDef: 6.7, magicDef: 4.2, fireDef: 6.4, lightningDef: 2.8, darkDef: 5.6, bleedRes: 25, poisonRes: 15, frostRes: 19, curseRes: 19, poise: 4.6, name: "Wolf Knight Leggings", description: "Leggings of a knight tainted by the dark of the Abyss.\nA vanquished knight left behind only wolf's blood, and his legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 16,000 Souls", weight: 5.1, durability: 350, imageKey: "arm_wolf_knight_leggings", position: Armour.ArmourPosition.Legs),
        .init(physDef: 4.5, strikeDef: 3.7, slashDef: 4.3, thrustDef: 4.2, magicDef: 3.7, fireDef: 4.1, lightningDef: 3.1, darkDef: 3.5, bleedRes: 24, poisonRes: 15, frostRes: 15, curseRes: 9, poise: 4, name: "Elite Knight Helm", description: "Helm said to have been given to elite knights of fallen Astora.\nThe mere mention of Astora invoked wistful pangs, and perhaps it was such a dream that drew Anri to this faraway home known only by name.", location: "Buy from Shrine Handmaid in Firelink Shrine after completing Anri of Astora's questline (or killing Anri) for 3000 souls.", weight: 5.3, durability: 380, imageKey: "arm_elite_knight_helm", position: Armour.ArmourPosition.Head),
        .init(physDef: 12.1, strikeDef: 9.2, slashDef: 12.1, thrustDef: 11.1, magicDef: 9.2, fireDef: 10.6, lightningDef: 6.8, darkDef: 8.5, bleedRes: 46, poisonRes: 32, frostRes: 33, curseRes: 18, poise: 8.8, name: "Elite Knight Armour", description: "Armor said to have been given to elite knights of fallen Astora.\nThe mere mention of Astora invoked wistful pangs, and perhaps it was such a dream that drew Anri to this faraway home known only by name.", location: "Buy from Shrine Handmaid in Firelink Shrine after completing Anri of Astora's questline (or killing Anri) for 4500 souls", weight: 8.9, durability: 350, imageKey: "arm_elite_knight_armor", position: Armour.ArmourPosition.Body),
        .init(physDef: 3.4, strikeDef: 2.8, slashDef: 3.4, thrustDef: 3.4, magicDef: 2.6, fireDef: 3.0, lightningDef: 2.0, darkDef: 2.4, bleedRes: 18, poisonRes: 13, frostRes: 14, curseRes: 9, poise: 2.3, name: "Elite Knight Gauntlets", description: "Gauntlets said to have been given to elite knights of fallen Astora.\nThe mere mention of Astora invoked wistful pangs, and perhaps it was such a dream that drew Anri to this faraway home known only by name.", location: "Buy from Shrine Handmaid in Firelink Shrine after completing Anri of Astora's questline (or killing Anri) for 3000 souls", weight: 3.4, durability: 350, imageKey: "arm_elite_knight_gauntlets", position: Armour.ArmourPosition.Arms),
        .init(physDef: 7.8, strikeDef: 6.5, slashDef: 7.6, thrustDef: 7.4, magicDef: 6.5, fireDef: 7.1, lightningDef: 5.3, darkDef: 6.1, bleedRes: 38, poisonRes: 25, frostRes: 26, curseRes: 17, poise: 7, name: "Elite Knight Leggings", description: "Leggings said to have been given to elite knights of fallen Astora.\nThe mere mention of Astora invokes wistful pangs, and perhaps it was such a dream that drew Anri to this faraway home known only by name.", location: "Buy from Shrine Handmaid in Firelink Shrine after completing Anri of Astora's questline (or killing Anri) for 3000 souls", weight: 6.9, durability: 370, imageKey: "arm_elite_knight_leggings", position: Armour.ArmourPosition.Legs),
        .init(physDef: 4.0, strikeDef: 4.2, slashDef: 3.4, thrustDef: 3.2, magicDef: 4.2, fireDef: 4.8, lightningDef: 4.2, darkDef: 4.2, bleedRes: 21, poisonRes: 29, frostRes: 28, curseRes: 27, poise: 2.2, name: "Golden Crown", description: "Crown of a nameless king who was ally to the ancient dragons.\nThis golden crown, buried amidst long strands of bristling ash, is said to closely resemble that of the First Lord.", location: "Buy from Shrine Handmaid for 8000 souls after killing The Nameless King", weight: 3.5, durability: 280, imageKey: "arm_golden_crown", position: Armour.ArmourPosition.Head),
        .init(physDef: 13.7, strikeDef: 12.2, slashDef: 13.1, thrustDef: 12.2, magicDef: 9.9, fireDef: 13.4, lightningDef: 6.1, darkDef: 9.9, bleedRes: 62, poisonRes: 43, frostRes: 46, curseRes: 28, poise: 16.1, name: "Dragonscale Armor", description: "Dragonscale armor of a nameless king who was ally to the ancient dragons.\nDragon scales are razor-sharp and cannot be burned.", location: "Buy from Shrine Handmaid for 12000 souls after killing The Nameless King", weight: 12.7, durability: 380, imageKey: "arm_dragonscale_armour", position: Armour.ArmourPosition.Body),
        .init(physDef: 1.5, strikeDef: 1.7, slashDef: 1.7, thrustDef: 0.7, magicDef: 1.7, fireDef: 2.3, lightningDef: 1.7, darkDef: 1.7, bleedRes: 10, poisonRes: 18, frostRes: 16, curseRes: 13, poise: 0.2, name: "Golden Bracelets", description: "Bracelets of a nameless king who was ally to the ancient dragons.\nThese golden bracelets, together with the golden breastplate and crown, are said to closely resemble those of the first lord.", location: "Buy from Shrine Handmaid for 8000 souls after killing The Nameless King", weight: 1.5, durability: 250, imageKey: "arm_golden_bracelets", position: Armour.ArmourPosition.Arms),
        .init(physDef: 6.9, strikeDef: 5.8, slashDef: 7.1, thrustDef: 5.8, magicDef: 4.1, fireDef: 6.8, lightningDef: 1.8, darkDef: 4.1, bleedRes: 31, poisonRes: 21, frostRes: 22, curseRes: 10, poise: 7.4, name: "Dragonscale Waistcloth", description: "Dragonscale waistcloth of a nameless king who was ally to the ancient dragons.\nDragon scales are razor-sharp and cannot be burned.", location: "Buy from Shrine Handmaid for 8000 souls after killing The Nameless King", weight: 6.3, durability: 360, imageKey: "arm_dragonscale_waistcloth", position: Armour.ArmourPosition.Legs)
        
        
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
