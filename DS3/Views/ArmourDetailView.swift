//
//  ArmourDetailView.swift
//  DS3
//
//  Created by Tom Clifford on 12/04/2021.
//

import SwiftUI

struct ArmourDetailView: View {
    let armour: Armour
    
    var body: some View
    {
        VStack
        {
            ArmourNameImageView(armour: armour)
            DefenceView(armour: armour)
                .padding(.bottom)
            StatusEffectView(armour: armour)
                .padding(.bottom)
            DescriptionView(armour: armour)
        }
    }
}

struct ArmourNameImageView: View
{
    let armour: Armour
    
    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(armour.Name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .multilineTextAlignment(.leading)
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("Durability")
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(String(armour.Durability))
                    }
                }
            }
            
            
            Spacer()
            Image(armour.ImageKey)
                .resizable()
                .frame(width: 90.0, height: 90.0)
        }
        .padding(.horizontal)
    }
}

struct DefenceView: View
{
    let armour: Armour
    
    var body: some View
    {
        VStack
        {
            Text("Defence")
                .bold()
            HStack
            {
                HStack
                {
                    VStack(alignment: .leading)
                    {
                        Text("Physical")
                        Text("Strike")
                        Text("Slash")
                        Text("Thrust")
                    }
                    Spacer()
                    VStack(alignment: .leading)
                    {
                        Text(String(armour.PhysDef))
                        Text(String(armour.StrikeDef))
                        Text(String(armour.SlashDef))
                        Text(String(armour.ThrustDef))
                    }
                    .padding(.top, 1.0)
                }.padding(.trailing)
                Spacer()
                VStack
                {
                    HStack
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Magic")
                            Text("Fire")
                            Text("Lightning")
                            Text("Dark")
                        }
                        Spacer()
                        VStack(alignment: .leading)
                        {
                            Text(String(armour.MagicDef))
                            Text(String(armour.FireDef))
                            Text(String(armour.LightningDef))
                            Text(String(armour.DarkDef))
                            
                        }
                    }
                    .padding(.top, 1.0)
                }
                .padding(.trailing)
            }
            .padding(.horizontal)
        }
    }
    
}

struct StatusEffectView: View
{
    let armour: Armour
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            Text("Effect Resistance")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.leading)
            HStack
            {
                // Groups used to get around max number of views in container being 10
                Group{
                    Text("Bleed:")
                    Text(String(armour.BleedRes))
                }
                Spacer()
                Group {
                    Text("Poison:")
                    Text(String(armour.PoisonRes))
                }
                Spacer()
                Group {
                    Text("Frost:")
                    Text(String(armour.FrostRes))
                }
                Spacer()
                Group {
                    Text("Curse:")
                    Text(String(armour.CurseRes))
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DescriptionView: View
{
    let armour: Armour
    
    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text("Description")
                    .font(.title2)
                    .bold()
                Text(armour.Description)
            }
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct ArmourDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let wolfKnightHelm = Armour(physDef: 4.4, strikeDef: 3.8, slashDef: 4.4, thrustDef: 4.4, magicDef: 3.0, fireDef: 4.2, lightningDef: 2.2, darkDef: 3.8, bleedRes: 23, poisonRes: 16, frostRes: 17, curseRes: 17, poise: 2.9, name: "Wolf Knight Helm", description: "Helm of a knight tainted by the dark of the Abyss. The twilight blue tassel is damp, and will ever remain so.\nA vanquished knight left behind only wolf's blood, and legacy of duty. The Undead Legion of Farron was formed to bear his torch, and the armor of these Abyss Watchers suggests their own eventual end.", location: "Buy from Shrine Handmaid in Untended Graves for 10,000 Souls", weight: 4.2, durability: 360, imageKey: "arm_wolf_knight_helm", position: Armour.ArmourPosition.Head)
        
        ArmourDetailView(armour: wolfKnightHelm)
        ArmourDetailView(armour: wolfKnightHelm)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ArmourNameImageView(armour: wolfKnightHelm)
        DefenceView(armour: wolfKnightHelm)
        StatusEffectView(armour: wolfKnightHelm)
        DescriptionView(armour: wolfKnightHelm)
    }
}

