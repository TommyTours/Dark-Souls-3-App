//
//  EquipmentRow.swift
//  DS3
//
//  Created by Tom Clifford on 06/04/2021.
//

import SwiftUI

struct EquipmentRow: View
{
    let equipment: Equipment
    @State var showingDetails = false
    var body: some View
    {
        Button {
            showingDetails = true
        } label: {
            HStack
            {
                Image(equipment.ImageKey)
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                Spacer()
                Text(equipment.Name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()
            .sheet(isPresented: $showingDetails) {
                WeaponDetailView(weapon: equipment as! Weapon)
            }
        }
    }
}

struct EquipmentRows: View
{
    @State var weaponList = WeaponList()
    
    var body: some View
    {
        NavigationView {
            List(weaponList.allWeapons) { weapon in
                EquipmentRow(
                    equipment: weapon
                )
                .navigationBarTitle("My Library")
            }
            
        }
    }
    
    struct EquipmentRow_Previews: PreviewProvider
    {
        
        
        
        static var previews: some View
        {
            let QuickStep = Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target.")
            
            let Stomp = Skill(name: "Stomp", description: "Use one's weight to lunge forward with a low stance and increased poise, and follow with a crushing strong attack.")
            
            let Dagger = Weapon(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: QuickStep, fpCost: 5)
            
            let FumeUltraGreatsword = Weapon(name: "Fume Ultra Greatsword", description: "This twisted sword, the heaviest of all ultra greatswords, resembles black slate.\nThis weapon, said to belong to a traitor from long ago, was so heavy that it found no owner, and became a forgotten relic of history.", location: "Dropped by Knight Slayer Tsorig underneath the Smoldering Lake.  He can be found beyond the areas with the rats and the basilisks, but before the exit that goes up to the ballista.", weight: 25.5, durability: 170, imageKey: "wpn_fume_ultra_greatsword", physAtk: 149, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 80, magDef: 55, fireDef: 65, lightningDef: 60, darkDef: 65, stability: 55, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Strike.rawValue], ability: Stomp, fpCost: 10)
            
            EquipmentRows()
        }
    }
}
