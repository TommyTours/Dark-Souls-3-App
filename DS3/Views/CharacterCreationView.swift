//
//  CharacterCreationView.swift
//  DS3
//
//  Created by Tom Clifford on 13/04/2021.
//

import SwiftUI

struct CharacterCreationView: View
{
    @Binding var characterList: CharacterList
    //@Binding var isShowingNewCharacter: Bool
    //@State private var newCharacter = Character()
    @State private var charName = ""
    
    @State private var selectedClass = Character.CharacterClass.Deprived
    
    @State private var level = 1
    
    @State private var remainingPoints = 0
    
    @State private var attributes = DS3.Attributes(charClass: .Deprived)
    
    @State private var vgr = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Vgr"]!
    
    @State private var att = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Att"]!
    
    @State private var end = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["End"]!
    
    @State private var vit = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Vit"]!
    
    @State private var str = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Str"]!
    
    @State private var dex = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Dex"]!
    
    @State private var intel = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Int"]!
    
    @State private var fth = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Fth"]!
    
    @State private var luck = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Luck"]!
    
    let noneWeapon = WeaponList.init().allWeapons.first!
    let noneHelmet = ArmourList.init().allHelms.first!
    let noneBody = ArmourList.init().allBodys.first!
    let noneArms = ArmourList.init().allArms.first!
    let noneLegs = ArmourList.init().allLegs.first!
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                NameLevelView(charName: $charName, level: $level)
                // Wasn't able to refactor this to subview while keeping the setBaseAttribute function working.
                Section(header: Text("Class"))
                {
                    Picker("Class", selection: $selectedClass)
                    {
                        ForEach(Character.CharacterClass.allCases) {
                            className in
                            Text(className.rawValue).tag(className)
                        }
                    }.onChange(of: selectedClass) {
                        value in
                        level = setBaseLevel(charClass: value)
                        setBaseAttributes(attributes: Character.ReturnBaseAttributeDict(charClass: value))
                    }
                }
                Section(header: Text("Attributes"))
                {
                AttributesViewEmbed(vgr: $vgr, att: $att, end: $end, vit: $vit, str: $str, dex: $dex, intel: $intel, fth: $fth, luck: $luck, level: $level, baseAttributes: Character.ReturnBaseAttributeDict(charClass: selectedClass))
                }
                Button(action: {
                        var newCharacter = Character(name: charName, charClass: selectedClass, rh1: noneWeapon, rh2: noneWeapon, rh3: noneWeapon, lh1: noneWeapon, lh2: noneWeapon, lh3: noneWeapon, head: noneHelmet, arms: noneArms, body: noneBody, legs: noneLegs)
                            print(newCharacter)
                    characterList.addCharacter(newCharacter: newCharacter)
                    
                }, label: { Text("Create Character")
                        })
            }.navigationBarTitle(Text("New Character"))
        }
    }
    
    func setBaseAttributes(attributes: Dictionary<String, Int>)
    {
        vgr = attributes["Vgr"]!
        att = attributes["Att"]!
        end = attributes["End"]!
        vit = attributes["Vit"]!
        str = attributes["Str"]!
        dex = attributes["Dex"]!
        intel = attributes["Int"]!
        fth = attributes["Fth"]!
        luck = attributes["Luck"]!
    }
    
    func setBaseLevel(charClass: Character.CharacterClass) -> Int
    {
        switch charClass {
        case .Knight:
            return 9
        case .Mercenary:
            return 8
        case .Warrior:
            return 7
        case .Herald:
            return 9
        case .Thief:
            return 5
        case .Assassin:
            return 10
        case .Sorcerer:
            return 6
        case .Pyromancer:
            return 8
        case .Cleric:
            return 7
        case .Deprived:
            return 1
        }
    }
}

/// Presently unused but may be used in another app
struct StatCounter: View
{
    @Binding var value: Int
    @Binding var statPoints: Int
    let isLevel: Bool // TODO: Workout how to default to false
    let name: String
    
    var body: some View
    {
        HStack
        {
            Text(name)
                .font(.title2)
                .bold()
            Spacer()
            HStack
            {
                Button(action: {
                    if value > 1 {
                        value -= 1
                        if !isLevel {
                            statPoints += 1
                        } else {
                            if statPoints > 0 {
                                statPoints -= 1
                            }
                        }
                    }
                }) {
                    Image(systemName: "arrowtriangle.left")
                        .resizable()
                }
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(String(value))
                    .bold()
                    .font(.title)
                    .frame(width: 45)
                Button(action: {
                    if isLevel {
                        value += 1
                        statPoints += 1
                    }else if statPoints > 0 {
                        value += 1
                        statPoints -= 1
                    }
                }) {
                    Image(systemName: "arrowtriangle.right")
                        .resizable()
                }
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct StepperView: View {
    @Binding var value: Int
    @Binding var level: Int
    let label: String
    let min: Int

    func incrementStep() {
        if value < 99
        {
            value += 1
            level += 1
        }
    }

    func decrementStep() {
        if value > min
        {
            value -= 1
            level -= 1
        }
    }

    var body: some View {
        Stepper(onIncrement: incrementStep,
                onDecrement: decrementStep) {
            HStack
            {
                Text("\(label):")
                Spacer()
                Text("\(value)")
            }
        }
    }

}
struct CharacterCreationView_Previews: PreviewProvider {
    static var previews: some View {
        //var testChar = Character(name: "", charClass: Character.CharacterClass.Deprived, rh1: nil, rh2: nil, rh3: nil, lh1: nil, lh2: nil, lh3: nil, head: nil, arms: nil, body: nil, legs: nil)
        CharacterCreationView(characterList: .constant(CharacterList.init()))
        CharacterCreationView(characterList: .constant(CharacterList.init()))
            .preferredColorScheme(.dark)
    }
}



struct NameLevelView: View {
    @Binding var charName: String
    @Binding var level: Int
    var body: some View {
        Section(header: Text("Character Name"))
        {
            TextField("Name", text: $charName)
        }
    }
}
