//
//  DS3App.swift
//  DS3
//
//  Created by Tom Clifford on 05/04/2021.
//

import SwiftUI

@main
struct DS3App: App {
    var body: some Scene {
        
        //let QuickStep = Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target.")
        
        //let Dagger = Weapon(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: QuickStep, fpCost: 5, strReq: 5, strScale: "E", dexReq: 14, dexScale: "C", intReq: 0, intScale: "-", fthReq: 0, fthScale: "-")


        
        WindowGroup {
            let myWeaponList = WeaponList.init().allWeapons
            let myArmourList = ArmourList.init().allArmours

            let sword = myWeaponList.first(where: {$0.Name == "Fume Ultra Greatsword"})
            let shield = myWeaponList.first(where: {$0.Name == "Grass Crest Shield"})
            let helm = myArmourList.first(where: {$0.Name == "Wolf Knight Helm"})
            let body = myArmourList.first(where: {$0.Name == "Wolf Knight Armor"})
            let legs = myArmourList.first(where: {$0.Name == "Wolf Knight Leggings"})
            let arms = myArmourList.first(where: {$0.Name == "Wolf Knight Gauntlets"})

            let QuickStep = Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target.")

            let Dagger = Weapon(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: QuickStep, fpCost: 5, strReq: 5, strScale: Weapon.Scaling.E.rawValue, dexReq: 14, dexScale: Weapon.Scaling.C.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.Dagger.rawValue)


            let testChar = Character(name: "Dave", charClass: Character.CharacterClass.Deprived, rh1: sword, rh2: nil, rh3: nil, lh1: shield, lh2: nil, lh3: nil, head: helm, arms: arms, body: body, legs: legs)

            //ContentView(weapon: Dagger, character: testChar)
            //EquipmentRows()
            CharacterCreationView()
        }
    }
}
