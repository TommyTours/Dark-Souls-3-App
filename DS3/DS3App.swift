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
        
        let QuickStep = Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target.")
        
        let Dagger = Weapon(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: QuickStep, fpCost: 5)


        
        WindowGroup {
            ContentView(weapon: Dagger)
        }
    }
}
