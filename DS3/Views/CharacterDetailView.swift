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
                let helm = character.Head?.Name ?? "None"
                Text("Head: \(helm)")
                let chest = character.Body?.Name ?? "None"
                Text("Chest: \(chest)")
                let arms = character.Arms?.Name ?? "None"
                Text("Arms: \(arms)")
                let legs = character.Legs?.Name ?? "None"
                Text("Legs: \(legs)")
                let lh1 = character.LeftHand1?.Name ?? "None"
                Text("Left Hand 1: \(lh1)")
                let lh2 = character.LeftHand2?.Name ?? "None"
                Text("Left Hand 2: \(lh2)")
                let lh3 = character.LeftHand3?.Name ?? "None"
                Text("Left Hand 3: \(lh3)")
                let rh1 = character.RightHand1?.Name ?? "None"
                Text("Right Hand 1: \(rh1)")
                let rh2 = character.RightHand2?.Name ?? "None"
                Text("Right Hand 2: \(rh2)")
                let rh3 = character.RightHand3?.Name ?? "None"
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

//struct NumberStepper: View
//{
//    var value: Int
//
//    var body: some View
//    {
//        HStack
//        {
//            //Button(action: { value += 1 } )
//            {
//            Image(systemName: "arrowtriangle.left")
//                .resizable()
//                //.foregroundColor(.black)
//                .frame(width: 40, height: 40)
//            }
//            Text(String(value))
//                .font(.largeTitle)
//            Image(systemName: "arrowtriangle.right")
//                .resizable()
//                .frame(width: 40, height: 40)
//        }
//    }
//}

struct CharacterDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let myWeaponList = WeaponList.init().allWeapons
        let myArmourList = ArmourList.init().allArmours
        
        let sword = myWeaponList.first(where: {$0.Name == "Fume Ultra Greatsword"})
        let shield = myWeaponList.first(where: {$0.Name == "Grass Crest Shield"})
        let helm = myArmourList.first(where: {$0.Name == "Wolf Knight Helm"})
        let body = myArmourList.first(where: {$0.Name == "Wolf Knight Armor"})
        let legs = myArmourList.first(where: {$0.Name == "Wolf Knight Leggings"})
        let arms = myArmourList.first(where: {$0.Name == "Wolf Knight Gauntlets"})
        
        let testChar = Character(name: "Dave", charClass: Character.CharacterClass.Deprived, rh1: sword, rh2: nil, rh3: nil, lh1: shield, lh2: nil, lh3: nil, head: helm, arms: arms, body: body, legs: legs)       //Character(Name: "Dave", Level: 10, Vigor: 3, Attunement: 4, Endurance: 5, Vitality: 6, Strength: 7, Dexterity: 8, Intelligence: 9, Faith: 10, Luck: 11, RightHand1: sword, RightHand2: nil, RightHand3: nil, LeftHand1: shield, LeftHand2: nil, LeftHand3: nil, Head: helm, Arms: arms, Body: armour, Legs: legs)
        
        CharacterDetailView(character: testChar)
        //CharacterAttributesView(character: testChar)
        //NumberStepper(value: testChar.Strength)
    }
}
