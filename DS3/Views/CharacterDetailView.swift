//
//  CharacterDetailView.swift
//  DS3
//
//  Created by Tom Clifford on 10/04/2021.
//

import SwiftUI

struct CharacterDetailView: View
{
    let character: Character
    
    var body: some View
    {
        
        VStack(alignment: .leading)
        {
            Text(character.Name)
                .font(.title)
            CharacterAttributesView(character: character)
            Group
            {
                let helm = character.Head.Name
                Text("Head: \(helm)")
                let chest = character.Body.Name
                Text("Chest: \(chest)")
                let arms = character.Arms.Name
                Text("Arms: \(arms)")
                let legs = character.Legs.Name
                Text("Legs: \(legs)")
                let lh1 = character.LeftHand1.Name
                Text("Left Hand 1: \(lh1)")
                let lh2 = character.LeftHand2.Name
                Text("Left Hand 2: \(lh2)")
                let lh3 = character.LeftHand3.Name
                Text("Left Hand 3: \(lh3)")
                let rh1 = character.RightHand1.Name
                Text("Right Hand 1: \(rh1)")
                let rh2 = character.RightHand2.Name
                Text("Right Hand 2: \(rh2)")
                let rh3 = character.RightHand3.Name
                Text("Right Hand 3: \(rh3)")
            }
        }
        .padding()
    }
}

struct CharacterAttributesView : View
{
    let character: Character
    
    var body: some View
    {
        GeometryReader { metrics in
            VStack(alignment: .leading)
            {
                Text("Attributes")
                HStack
                {
                    Text("Vigor:")
                    Spacer()
                    Text(String(character.Attributes.Vigor))
                }
                HStack
                {
                    Text("Attunement:")
                    Spacer()
                    Text(String(character.Attributes.Attunement))
                }
                HStack
                {
                    Text("Endurance:")
                    Spacer()
                    Text(String(character.Attributes.Endurance))
                }
                HStack
                {
                    Text("Vitality:")
                    Spacer()
                    Text(String(character.Attributes.Vitality))
                }
                HStack
                {
                    Text("Strength:")
                    Spacer()
                    Text(String(character.Attributes.Strength))
                }
                HStack
                {
                    Text("Dexterity:")
                    Spacer()
                    Text(String(character.Attributes.Dexterity))
                }
                HStack
                {
                    Text("Intelligence:")
                    Spacer()
                    Text(String(character.Attributes.Intelligence))
                }
                HStack
                {
                    Text("Faith:")
                    Spacer()
                    Text(String(character.Attributes.Faith))
                }
                HStack
                {
                    Text("Luck:")
                    Spacer()
                    Text(String(character.Attributes.Luck))
                }
            }
            .padding()
            .frame(maxWidth: metrics.size.width * 0.5)
        }
    }
}

struct CharacterWeaponRows: View
{
    @Binding var character: Character
    var body: some View
    {
        List {
            WeaponRow(weapon: $character.RightHand1)
            WeaponRow(weapon: $character.RightHand2)
            WeaponRow(weapon: $character.RightHand3)
        }
    }
}

struct WeaponRow: View
{
    @Binding var weapon: Weapon
    var body: some View
    {
        if weapon != nil {
            NavigationLink(destination: WeaponDetailView(weapon: weapon)){
                Text(weapon.Name)
            }
        } else {
            Text("None")
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let myWeaponList = WeaponList.init().allWeapons
        let myArmourList = ArmourList.init().allArmours
        
        let sword = myWeaponList.first(where: {$0.Name == "Fume Ultra Greatsword"})!
        let noneWeapon = myWeaponList.first!
        let shield = myWeaponList.first(where: {$0.Name == "Grass Crest Shield"})!
        let helm = myArmourList.first(where: {$0.Name == "Wolf Knight Helm"})!
        let body = myArmourList.first(where: {$0.Name == "Wolf Knight Armor"})!
        let legs = myArmourList.first(where: {$0.Name == "Wolf Knight Leggings"})!
        let arms = myArmourList.first(where: {$0.Name == "Wolf Knight Gauntlets"})!
        
        var testChar = Character(name: "Dave", charClass: Character.CharacterClass.Deprived, rh1: sword, rh2: noneWeapon, rh3: noneWeapon, lh1: shield, lh2: noneWeapon, lh3: noneWeapon, head: helm, arms: arms, body: body, legs: legs)
        CharacterWeaponRows(character: .constant(Character(name: "Dave", charClass: Character.CharacterClass.Deprived, rh1: sword, rh2: noneWeapon, rh3: noneWeapon, lh1: shield, lh2: noneWeapon, lh3: noneWeapon, head: helm, arms: arms, body: body, legs: legs)
))
    }
}
