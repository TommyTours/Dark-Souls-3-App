//
//  RequirementsView.swift
//  DS3
//
//  Created by Tom Clifford on 29/04/2021.
//

import SwiftUI

struct RequirementsView: View {
    var localCharacter: Character
    var requiredAttributes: Attributes
    let maxEquip: Float
    let equipLoad: Float
    let requiredLevels: Int
    let numFormatter: NumberFormatter
    
    init(character: Character)
    {
        self.localCharacter = character
        let weaponsArray = [character.RightHand1, character.RightHand2, character.RightHand3, character.LeftHand1, character.LeftHand2, character.LeftHand3]
        let requiredStr = weaponsArray.max(by: { weapon1, weapon2 in weapon1.StrReq < weapon2.StrReq })!.StrReq
        let requiredDex = weaponsArray.max(by: { weapon1, weapon2 in weapon1.DexReq < weapon2.DexReq })!.DexReq
        let requiredInt = weaponsArray.max(by: { weapon1, weapon2 in weapon1.IntReq < weapon2.IntReq })!.IntReq
        let requiredFth = weaponsArray.max(by: { weapon1, weapon2 in weapon1.FthReq < weapon2.FthReq })!.FthReq
        requiredAttributes = Attributes(strength: requiredStr, dexterity: requiredDex, intelligence: requiredInt, faith: requiredFth)
        maxEquip = 40.0 + Float(localCharacter.Attributes.Vitality)
        var load: Float = 0.0
        weaponsArray.forEach { weapon in
            load += weapon.Weight
        }
        numFormatter = NumberFormatter()
        numFormatter.maximumFractionDigits = 1
        load += localCharacter.Head.Weight
        load += localCharacter.Body.Weight
        load += localCharacter.Arms.Weight
        load += localCharacter.Legs.Weight
        equipLoad = load
        requiredLevels = RequirementsView.getRequiredLevel(currentAttributes: localCharacter.Attributes, requiredAttributes: requiredAttributes)
    }
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                Section
                {
                    Text("Attribute Requirements:")
                        .font(.title)
                    HStack
                    {
                        VStack(alignment: .leading)
                        {
                            Text("Attribute")
                            Text("Strength:")
                            Text("Dexterity:")
                            Text("Intelligence:")
                            Text("Faith:")
                            //Text("Vitality:")
                            //Text("Equip Load:")
                        }
                        VStack
                        {
                            Text("Required")
                            Text("\(requiredAttributes.Strength)")
                            Text("\(requiredAttributes.Dexterity)")
                            Text("\(requiredAttributes.Intelligence)")
                            Text("\(requiredAttributes.Faith)")
                        }
                        VStack
                        {
                            Text("Current")
                            Text("\(localCharacter.Attributes.Strength)")
                                .foregroundColor(localCharacter.Attributes.Strength >= requiredAttributes.Strength ? .green : .red)
                            Text("\(localCharacter.Attributes.Dexterity)")
                                .foregroundColor(localCharacter.Attributes.Dexterity >= requiredAttributes.Dexterity ? .green : .red)
                            Text("\(localCharacter.Attributes.Intelligence)")
                                .foregroundColor(localCharacter.Attributes.Intelligence >= requiredAttributes.Intelligence ? .green : .red)
                            Text("\(localCharacter.Attributes.Faith)")
                                .foregroundColor(localCharacter.Attributes.Faith >= requiredAttributes.Faith ? .green : .red)
                        }
                    }.padding()
                }
                Section
                {
                    Text("Level Requirements:")
                        .font(.title)
                    if requiredLevels > 0
                    {
                        Text("Required Levels: \(requiredLevels)")
                        Text("Souls to reach level: \(Attributes.getRequiredSouls(current: localCharacter.Level, required: localCharacter.Level + requiredLevels))")
                    }
                    else
                    {
                        Text("No additional levels required.")
                    }
                }
                Section
                {
                    Text("Equipment Locations:")
                        .font(.title)
                        .padding()
                    VStack(alignment: .leading)
                    {
                        if localCharacter.RightHand1.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.RightHand1.Name):")
                                    .font(.headline)
                                Text(localCharacter.RightHand1.Location)
                            }
                        }
                        if localCharacter.RightHand2.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.RightHand2.Name):")
                                    .font(.headline)
                                Text(localCharacter.RightHand2.Location)
                            }
                        }
                        if localCharacter.RightHand3.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.RightHand3.Name):")
                                    .font(.headline)
                                Text(localCharacter.RightHand3.Location)
                            }
                        }
                        if localCharacter.LeftHand1.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.LeftHand1.Name):")
                                    .font(.headline)
                                Text(localCharacter.LeftHand1.Location)
                            }
                        }
                        if localCharacter.LeftHand2.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.LeftHand2.Name):")
                                    .font(.headline)
                                Text(localCharacter.LeftHand2.Location)
                            }
                        }
                        if localCharacter.LeftHand3.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.LeftHand3.Name):")
                                    .font(.headline)
                                Text(localCharacter.LeftHand3.Location)
                            }
                        }
                        if localCharacter.Head.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.Head.Name):")
                                    .font(.headline)
                                Text(localCharacter.Head.Location)
                            }
                        }
                        if localCharacter.Body.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.Body.Name):")
                                    .font(.headline)
                                Text(localCharacter.Body.Location)
                            }
                        }
                        if localCharacter.Arms.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.Arms.Name):")
                                    .font(.headline)
                                Text(localCharacter.Arms.Location)
                            }
                        }
                        if localCharacter.Legs.Name != "None"
                        {
                            VStack(alignment: .leading)
                            {
                                Text("\(localCharacter.Legs.Name):")
                                    .font(.headline)
                                Text(localCharacter.Legs.Location)
                            }
                        }
                    }
                }
            }.padding()
        }
        
    }
    
    static func getRequiredLevel(currentAttributes: Attributes, requiredAttributes: Attributes) -> Int
    {
        var levelsNeeded = 0
        if currentAttributes.Strength < requiredAttributes.Strength
        {
            levelsNeeded += requiredAttributes.Strength - currentAttributes.Strength
        }
        if currentAttributes.Dexterity < requiredAttributes.Dexterity
        {
            levelsNeeded += requiredAttributes.Dexterity - currentAttributes.Strength
        }
        if currentAttributes.Intelligence < requiredAttributes.Intelligence
        {
            levelsNeeded += requiredAttributes.Intelligence - currentAttributes.Intelligence
        }
        if currentAttributes.Faith < requiredAttributes.Faith
        {
            levelsNeeded += requiredAttributes.Faith - currentAttributes.Faith
        }
        return levelsNeeded
    }
}

struct RequirementsView_Previews: PreviewProvider {
    static var previews: some View {
        let myChar = CharacterList.init().allCharacters.first!
        RequirementsView(character: myChar)
    }
}
