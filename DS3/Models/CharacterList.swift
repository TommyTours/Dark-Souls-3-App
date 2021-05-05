//
//  CharacterList.swift
//  DS3
//
//  Created by Tom Clifford on 28/04/2021.
//

import Foundation

struct CharacterList
{
    var allCharacters: [Character] { charactersCache }
    
    /// An in memory cache of weapons  that are persistently stored
    private var charactersCache: [Character] = [
//        .init(name: "Dave",
//              charClass: Character.CharacterClass.Deprived,
//              rh1: WeaponList.init().allWeapons.first(where: {$0.Name == "Fume Ultra Greatsword"})!,
//              rh2: WeaponList.init().allWeapons.first!,
//              rh3: WeaponList.init().allWeapons.first!,
//              lh1: WeaponList.init().allWeapons.first(where: {$0.Name == "Grass Crest Shield"})!,
//              lh2: WeaponList.init().allWeapons.first!,
//              lh3: WeaponList.init().allWeapons.first!,
//              head: ArmourList.init().allHelms.first(where: {$0.Name == "Wolf Knight Helm"})!,
//              arms: ArmourList.init().allArms.first(where: {$0.Name == "Wolf Knight Gauntlets"})!,
//              body: ArmourList.init().allBodys.first(where: {$0.Name == "Wolf Knight Armor"})!,
//              legs: ArmourList.init().allLegs.first(where: {$0.Name == "Wolf Knight Leggings"})!)
    ]

    mutating func addCharacter(newCharacter: Character)
    {
        charactersCache.insert(newCharacter, at: charactersCache.count)
    }
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
