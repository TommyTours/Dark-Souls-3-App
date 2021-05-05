//
//  WeaponDetailView.swift
//  DS3
//
//  Created by Tom Clifford on 05/04/2021.
//

import SwiftUI

struct WeaponDetailView: View
{
    let weapon: Weapon
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                WeaponNameImageView(weapon: weapon)
                    .padding(.top)
                AtkDefView(weapon: weapon)
                    .padding(.bottom)
                AddedEffectView(weapon: weapon)
                    .padding(.bottom)
                WeaponAttributesView(weapon: weapon)
                    .padding(.bottom)
                SkillDescriptionView(weapon: weapon)
                Spacer()
            }
        }
    }
}

struct WeaponNameImageView: View
{
    let weapon: Weapon
    
    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(weapon.Name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .multilineTextAlignment(.leading)
                Text(weapon.WeaponType)
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        
                        Text("Damage Type:")
                        Text("Ability:")
                        Text("Durability")
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(printDmgType(weapon: weapon))
                        Text(weapon.Ability.name)
                        Text(String(weapon.Durability))
                    }
                }
            }
            Spacer()
            Image(weapon.ImageKey)
                .resizable()
                .frame(width: 90.0, height: 90.0)
        }
        .padding(.horizontal)
    }
    
    func printDmgType(weapon: Weapon) -> String
    {
        if weapon.DmgType.count == 0
        {
            return "Missing Damage Type"
        }
        if weapon.DmgType.count == 1
        {
            return weapon.DmgType.first!
            
        }
        else
        {
            return String(weapon.DmgType.reduce("", {output, type in
                output + type + "/"
            }).dropLast())
        }
    }
    
    
}

struct AtkDefView: View
{
    let weapon: Weapon
    
    var body: some View
    {
        HStack
        {
            VStack
            {
                Text("Attack")
                    .bold()
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("Physical")
                        Text("Magic")
                        Text("Fire")
                        Text("Lightning")
                        Text("Dark")
                        Text("Critical")
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(String(weapon.PhysAtk))
                        Text(String(weapon.MagAtk))
                        Text(String(weapon.FireAtk))
                        Text(String(weapon.LightningAtk))
                        Text(String(weapon.DarkAtk))
                        Text(String(weapon.Critical))
                    }
                }
                .padding(.top, 1.0)
            }.padding(.trailing)
            
            Spacer()
            VStack
            {
                Text("Damage Reduction")
                    .bold()
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("Physical")
                        Text("Magic")
                        Text("Fire")
                        Text("Lightning")
                        Text("Dark")
                        Text("Stability")
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(String(weapon.PhysDef))
                        Text(String(weapon.MagDef))
                        Text(String(weapon.FireDef))
                        Text(String(weapon.LightningDef))
                        Text(String(weapon.DarkDef))
                        Text(String(weapon.Stability))
                    }
                }
                .padding(.top, 1.0)
            }
            .padding(.trailing)
        }
        .padding(.horizontal)
    }
}

struct AddedEffectView: View
{
    let weapon: Weapon
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("Added Effects")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.leading)
            HStack
            {
                Text("Bleed:")
                Text(String(weapon.Bleed))
                Spacer()
                Text("Poison:")
                Text(String(weapon.Poison))
                Spacer()
                Text("Frost:")
                Text(String(weapon.Frost))
            }
        }
        .padding(.horizontal)
    }
}

struct WeaponAttributesView: View
{
    let weapon: Weapon
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("Attributes")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.leading)
            HStack
            {
                VStack
                {
                    Text("")
                    Text("Required")
                    Text("Bonus")
                }
                Spacer()
                VStack
                {
                    Text("Str")
                    Text(String(weapon.StrReq))
                    Text(weapon.StrScale)
                }
                Spacer()
                VStack
                {
                    Text("Dex")
                    Text(String(weapon.DexReq))
                    Text(weapon.DexScale)
                }
                Spacer()
                VStack
                {
                    Text("Int")
                    Text(String(weapon.IntReq))
                    Text(weapon.IntScale)
                }
                Spacer()
                VStack
                {
                    Text("Fth")
                    Text(String(weapon.FthReq))
                    Text(weapon.FthScale)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct AttributeViewGrid: View
{
    let weapon: Weapon
    
    //    let data = [
    //        Text(""),
    //        GridHeadText(text: "Str"),
    //        GridHeadText(text: "Dex"),
    //        GridHeadText(text: "Int"),
    //        GridHeadText(text: "Fth"),
    //        GridHeadText(text: "Required"),
    //        GridDataText(text: Strin g(weapon.StrReq)),
    //        GridDataText(text: String(weapon.DexReq)),
    //        GridDataText(text: String(weapon.IntReq)),
    //        GridDataText(text: String(weapon.FthReq)), ]
    var columns: [GridItem] =
        [.init(.flexible()),
         .init(.flexible()),
         .init(.flexible()),
         .init(.flexible()),
         .init(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach((0...100), id: \.self) { index in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.pink)
                        .frame(height: 50)
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.blue)
                        .frame(height: 50)
                }
            }.font(.body)
        }
    }
}

struct GridHeadText: View
{
    let text: String
    
    var body: some View
    {
        Text(text)
    }
}

struct GridDataText: View
{
    let text: String
    
    var body: some View
    {
        Text(text)
    }
}

struct SkillDescriptionView: View
{
    let weapon: Weapon
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Description")
                        .font(.title2)
                        .bold()
                    Text(weapon.Description)
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.bottom)
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Skill: \(weapon.Ability.name)")
                        .font(.title2)
                        .bold()
                    Text(weapon.Ability.description)
                    Text("FP Cost: \(weapon.FPCost)")
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct WeaponDetailView_Previews: PreviewProvider {
    static var previews: some View
    {
        let QuickStep = Skill(name: "Quickstep", description: "Instantly step behind or around the side of foes. Especially effective when locked on to target.")
        
        let Stomp = Skill(name: "Stomp", description: "Use one's weight to lunge forward with a low stance and increased poise, and follow with a crushing strong attack.")
        
        let Dagger = Weapon(name: "Dagger", description: "Standard small dagger.\nSmall daggers lack power or reach, but can deal quick consecutive hits due to their light weight. Highly effective when used for critical hits, such as after parrying or attacking from behind.", location: "Buy for 300 souls from Shrine Handmaid.", weight: 1.5, durability: 50, imageKey: "wpn_dagger", physAtk: 65, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 130, physDef: 35, magDef: 20, fireDef: 15, lightningDef: 15, darkDef: 20, stability: 15, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Slash.rawValue, Weapon.DamageType.Thrust.rawValue], ability: QuickStep, fpCost: 5, strReq: 5, strScale: Weapon.Scaling.E.rawValue, dexReq: 14, dexScale: Weapon.Scaling.C.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.Dagger.rawValue)
        
        let FumeUltraGreatsword = Weapon(name: "Fume Ultra Greatsword", description: "This twisted sword, the heaviest of all ultra greatswords, resembles black slate.\nThis weapon, said to belong to a traitor from long ago, was so heavy that it found no owner, and became a forgotten relic of history.", location: "Dropped by Knight Slayer Tsorig underneath the Smoldering Lake.  He can be found beyond the areas with the rats and the basilisks, but before the exit that goes up to the ballista.", weight: 25.5, durability: 170, imageKey: "wpn_fume_ultra_greatsword", physAtk: 149, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 100, physDef: 80, magDef: 55, fireDef: 65, lightningDef: 60, darkDef: 65, stability: 55, bleed: 0, poison: 0, frost: 0, dmgType: [Weapon.DamageType.Strike.rawValue], ability: Stomp, fpCost: 10, strReq: 50, strScale: Weapon.Scaling.A.rawValue, dexReq: 10, dexScale: Weapon.Scaling.E.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: Weapon.WeaponTypes.UltraGreatsword.rawValue)
        
        WeaponDetailView(weapon: Dagger)
        WeaponDetailView(weapon: Dagger)
            .preferredColorScheme(.dark)
        WeaponDetailView(weapon: FumeUltraGreatsword)
        WeaponDetailView(weapon: FumeUltraGreatsword)
            .preferredColorScheme(.dark)
        AttributeViewGrid(weapon: Dagger)
    }
}
