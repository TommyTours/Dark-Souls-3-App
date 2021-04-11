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
        //        let rightWeapon1 = character.RightHand1?.Name ?? "None"
        //        let rightWeapon2 = character.RightHand2?.Name ?? "None"
        //        let rightWeapon3 = character.RightHand3?.Name ?? "None"
        //        let leftWeapon1 = character.LeftHand1?.Name ?? "None"
        //        let leftWeapon2 = character.LeftHand2?.Name ?? "None"
        //
        //        let leftWeapon3 = character.LeftHand3?.Name ?? "None"
        
        VStack
        {
            Text(character.Name)
                .font(.title)
            CharacterAttributesView(character: character)
        }
        
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
                    Text(String(character.Vigor))
                }
                HStack
                {
                    Text("Attunement:")
                    Spacer()
                    Text(String(character.Attunement))
                }
                HStack
                {
                    Text("Endurance:")
                    Spacer()
                    Text(String(character.Endurance))
                }
                HStack
                {
                    Text("Vitality:")
                    Spacer()
                    Text(String(character.Vitality))
                }
                HStack
                {
                    Text("Strength:")
                    Spacer()
                    Text(String(character.Strength))
                }
                HStack
                {
                    Text("Dexterity:")
                    Spacer()
                    Text(String(character.Dexterity))
                }
                HStack
                {
                    Text("Intelligence:")
                    Spacer()
                    Text(String(character.Intelligence))
                }
                HStack
                {
                    Text("Faith:")
                    Spacer()
                    Text(String(character.Faith))
                }
                HStack
                {
                    Text("Luck:")
                    Spacer()
                    Text(String(character.Luck))
                }
            }
            .padding()
            .frame(maxWidth: metrics.size.width * 0.5)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider
{
    static var previews: some View
    {
        let testWeapo = WeaponList.init()
        
        let testChar = Character(Name: "Dave", Level: 10, Vigor: 3, Attunement: 4, Endurance: 5, Vitality: 6, Strength: 7, Dexterity: 8, Intelligence: 9, Faith: 10, Luck: 11, RightHand1: testWeapo.allWeapons.first, RightHand2: nil, RightHand3: nil, LeftHand1: nil, LeftHand2: nil, LeftHand3: nil, Head: nil, Arms: nil, Body: nil, Legs: nil)
        CharacterDetailView(character: testChar)
        //CharacterAttributesView(character: testChar)
    }
}
