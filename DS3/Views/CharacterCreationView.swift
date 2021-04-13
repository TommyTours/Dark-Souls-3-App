//
//  CharacterCreationView.swift
//  DS3
//
//  Created by Tom Clifford on 13/04/2021.
//

import SwiftUI

struct CharacterCreationView: View
{
    //@State private var newCharacter = Character()
    
    @State private var selectedClass = Character.CharacterClass.Deprived
    
    @State private var level = 1
    
    @State private var attributes = DS3.Attributes(charClass: .Deprived)
    
    @State private var vgr = Character.ReturnBaseAttributeDict(charClass: Character.CharacterClass.Deprived)["Vgr"]!
    
    var body: some View
    {
        
        ScrollView {
            VStack(alignment: .leading)
            {
                Section(header: Text("Class: \(selectedClass.rawValue)"))
                {
                    Picker("Class", selection: $selectedClass)
                    {
                        ForEach(Character.CharacterClass.allCases) {
                            className in
                            Text(className.rawValue).tag(className)
                        }
                    }
                    .onChange(of: selectedClass, perform: { value in
                        level = setBaseLevel(charClass: value)
                        attributes = DS3.Attributes(charClass: value)
                    })
                }.padding()
                Section(header: Text("Level"))
                {
                    StepperView(value: $level, label: "Level")
                }.padding()
                Section(header: Text("Attributes"))
                {
                    StepperView(value: $attributes.Vigor, label: "Vigor")
                    StepperView(value: $attributes.Attunement, label: "Attuenemnt")
                    StepperView(value: $attributes.Endurance, label: "Endurance")
                    StepperView(value: $attributes.Vitality, label: "Vitality")
                    StepperView(value: $attributes.Strength, label: "Strength")
                    StepperView(value: $attributes.Dexterity, label: "Dexterity")
                    StepperView(value: $attributes.Intelligence, label: "Intelligence")
                    StepperView(value: $attributes.Faith, label: "Faith")
                    StepperView(value: $attributes.Luck, label: "Luck")
                    
                }.padding()
                Text("Slectesd class: \(selectedClass.rawValue)")
                Text("Level: \(level)")
                Text("Vigor: \(attributes.Vigor)")
                
            }
        }
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

struct StepperView: View
{
    @Binding var value: Int
    let label: String
    let step = 1
    let range = 1...99
    
    var body: some View
    {
        Stepper(value: $value, in: range, step: step) {
            Text("\(label) \(value)").bold()
        }
    }
}

struct CharacterCreationView_Previews: PreviewProvider {
    static var previews: some View {
        //var testChar = Character(name: "", charClass: Character.CharacterClass.Deprived, rh1: nil, rh2: nil, rh3: nil, lh1: nil, lh2: nil, lh3: nil, head: nil, arms: nil, body: nil, legs: nil)
        CharacterCreationView()
    }
}
