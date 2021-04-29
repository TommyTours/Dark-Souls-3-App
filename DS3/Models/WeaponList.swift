//
//  WeaponList.swift
//  DS3
//
//  Created by Tom Clifford on 06/04/2021.
//

import Foundation

struct WeaponList
{
    var allWeapons: [Weapon] { weaponsCache }
    
    /// An in memory cache of weapons  that are persistently stored
    private var weaponsCache: [Weapon] = [
        .init(name: "None", description: "None", location: "None", weight: 0.0, durability: 0, imageKey: "wpn_none", physAtk: 0, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 0, physDef: 0, magDef: 0, fireDef: 0, lightningDef: 0, darkDef: 0, stability: 0, bleed: 0, poison: 0, frost: 0, dmgType: [], ability: Skill(name: "Parry", description: "Parrys the foes attack"), fpCost: 0, strReq: 0, strScale: Weapon.Scaling.None.rawValue, dexReq: 0, dexScale: Weapon.Scaling.None.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: "None"),
        .init(name: "Fume Ultra Greatsword", description: "This twisted sword, the heaviest of all ultra greatswords, resembles black slate.\nThis weapon, said to belong to a traitor from long ago, was so heavy that it found no owner, and became a forgotten relic of history.", location: "Dropped by Knight Slayer Tsorig underneath the Smoldering Lake.  He can be found beyond the areas with the rats and the basilisks, but before the exit that goes up to the ballista.", weight: 25.5, durability: 170, imageKey: "wpn_fume_ultra_greatsword", physAtk: 149, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 80, magDef: 55, fireDef: 65, lightningDef: 60, darkDef: 65, stability: 55, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Strike.rawValue], ability: Skill(name: "Stomp", description: "Use one's weight to lunge forward with a low stance and increased poise, and follow with a crushing strong attack."), fpCost: 10, strReq: 50, strScale: Weapon.Scaling.A.rawValue, dexReq: 10, dexScale: Weapon.Scaling.E.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.UltraGreatsword.rawValue),
        .init(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target."), fpCost: 5, strReq: 5, strScale: Weapon.Scaling.E.rawValue, dexReq: 14, dexScale: Weapon.Scaling.C.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.Dagger.rawValue),
        .init(name: "Grass Crest Shield", description: "Old medium metal shield of unknown origin.\nThe grass crest is lightly imbued with magic, which slightly speeds stamina recovery", location: "Road of Sacrifices: From the Crucifixion Woods bonfire, drop down to the right of the large crab towards one of the large trees. Loot the corpse on the right side of the tree.", weight: 4.5, durability: 75, imageKey: "wpn_grass_crest_shield", physAtk: 92, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 89, magDef: 43, fireDef: 38, lightningDef: 38, darkDef: 36, stability: 50, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Strike.rawValue], ability: Skill(name: "Parry", description: "Repel an attack at the right time to follow up with a critical hit.\nWorks when equipped in either hand"), fpCost: 0, strReq: 10, strScale: Weapon.Scaling.D.rawValue, dexReq: 0, dexScale: Weapon.Scaling.None.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.Shield.rawValue),
        .init(name: "Black Blade", description: "A short katana wielded by the swordsman and distinguished guest of High Lord Wolnir. This shiny black blade is thick, but shorter than the typical katana.\nThe swordsman was a master of a rare technique, traces of which can be observed in this weapon's strong attack.", location: "Looted from a Mimic chest near the Flame Demon, on the way to Smouldering Lake.", weight: 6.5, durability: 50, imageKey: "wpn_black_blade", physAtk: 122, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 50, magDef: 30, fireDef: 25, lightningDef: 25, darkDef: 30, stability: 35, bleed: 30, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: Skill(name: "Hold", description: "Assume a holding stance to rapidly execute a lunging slash with a normal attack, or a deflecting parry with a strong attack."), fpCost: 0, strReq: 18, strScale: Weapon.Scaling.E.rawValue, dexReq: 18, dexScale: Weapon.Scaling.C.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.Katana.rawValue)
        
    ]
    
}
/// An in memory cache of weapons  that are persistently stored
//    @Published private var weaponsCache: [Weapon] =
//    (
//        try? JSONDecoder().decode(
//            [Weapon].self, from: .init(contentsOf: .jsonURL)
//        )
//    ).filter { _ in !PreviewDevice.inXcode }
//    ??
//    [ .init(name: "Fume Ultra Greatsword", description: "This twisted sword, the heaviest of all ultra greatswords, resembles black slate.\nThis weapon, said to belong to a traitor from long ago, was so heavy that it found no owner, and became a forgotten relic of history.", location: "Dropped by Knight Slayer Tsorig underneath the Smoldering Lake.  He can be found beyond the areas with the rats and the basilisks, but before the exit that goes up to the ballista.", weight: 25.5, durability: 170, physAtk: 149, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 80, magDef: 55, fireDef: 65, lightningDef: 60, darkDef: 65, stability: 55, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Strike.rawValue], ability: Skill(name: "Stomp", description: "Use one's weight to lunge forward with a low stance and increased poise, and follow with a crushing strong attack."), fpCost: 10, imagekey: "wpn_fume_ultra_greatsword"),
//      .init(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target."), fpCost: 5)
//    ]
//}
//
//private extension URL
//{
//    static let jsonURL = Self(fileName: "Weapons", extension: "json")
//
//    init(fileName: String, extension: String)
//    {
//        self = FileManager.`default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            .appendingPathComponent(fileName)
//            .appendingPathExtension(`extension`)
//    }
//}
