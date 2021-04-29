//
//  SingleCharacterView.swift
//  DS3
//
//  Created by Tom Clifford on 19/04/2021.
//

import SwiftUI

struct SingleCharacterView: View {
    
    @State var currentCharacter = Character()
    @State var isShowingAttributes = false
    var name: String// = "Dave"
    @State var level: Int// = 1
    @State var attributes: Attributes
    @State var charClass: Character.CharacterClass// = Character.CharacterClass.Deprived
    var myWeaponList = WeaponList.init().allWeapons
    var myHelmList = ArmourList.init().allHelms
    var myBodyList = ArmourList.init().allBodys
    var myArmsList = ArmourList.init().allArms
    var myLegsList = ArmourList.init().allLegs
    @State var rh1: Weapon// = WeaponList.init().allWeapons[0]
    @State var rh2: Weapon// = WeaponList.init().allWeapons[0]
    @State var rh3: Weapon// = WeaponList.init().allWeapons[0]
    @State var lh1: Weapon// = WeaponList.init().allWeapons[0]
    @State var lh2: Weapon// = WeaponList.init().allWeapons[0]
    @State var lh3: Weapon// = WeaponList.init().allWeapons[0]
    @State var head: Armour// = ArmourList.init().allHelms[0]
    @State var torso: Armour// = ArmourList.init().allBodys[0]
    @State var arms: Armour// = ArmourList.init().allArms[0]
    @State var legs: Armour// = ArmourList.init().allLegs[0]
    
    init(initCharacter: Character)
    {
        self.currentCharacter = initCharacter
        self.name = initCharacter.Name
        self.charClass = initCharacter.CharClass
        self.level = initCharacter.Level
        self.attributes = initCharacter.Attributes
        self.myWeaponList = WeaponList.init().allWeapons
        let myArmourList = ArmourList.init()
        self.myHelmList = myArmourList.allHelms
        self.myBodyList = myArmourList.allBodys
        self.myArmsList = myArmourList.allArms
        self.myLegsList = myArmourList.allLegs
        self.rh1 = initCharacter.RightHand1
        self.rh2 = initCharacter.RightHand2
        self.rh3 = initCharacter.RightHand3
        self.lh1 = initCharacter.LeftHand1
        self.lh2 = initCharacter.LeftHand2
        self.lh3 = initCharacter.LeftHand3
        self.head = initCharacter.Head
        self.torso = initCharacter.Body
        self.arms = initCharacter.Arms
        self.legs = initCharacter.Legs
        
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    CharacterClassLevelView(charClass: $charClass, level: $level)
                }
                Section
                {
                    
                    NavigationLink(
                        destination:
                            AttributesViewNavView(vgr: $attributes.Vigor,
                                                  att: $attributes.Attunement,
                                                  end: $attributes.Endurance,
                                                  vit: $attributes.Vitality,
                                                  str: $attributes.Strength,
                                                  dex: $attributes.Dexterity,
                                                  intel: $attributes.Intelligence,
                                                  fth: $attributes.Faith,
                                                  luck: $attributes.Luck,
                                                  level: $level,
                                                  baseAttributes: Character.ReturnBaseAttributeDict(charClass: charClass)
                            ),
                        isActive: $isShowingAttributes
                    ) {
                        Text("View/Edit Attributes")
                    }
                    .onChange(of: isShowingAttributes) { newValue in
                        print("Changed to \(newValue)")
                        currentCharacter.updateAttributes(vigor: attributes.Vigor, attunement: attributes.Attunement, endurance: attributes.Endurance, vitality: attributes.Vitality, strength: attributes.Strength, dexterity: attributes.Dexterity, intelligence: attributes.Intelligence, faith: attributes.Faith, luck: attributes.Luck, level: level)
                    }
                }
                RightHandView(rh1: $currentCharacter.RightHand1, rh2: $currentCharacter.RightHand2, rh3: $currentCharacter.RightHand3, weaponList: myWeaponList)
                LeftHandView(lh1: $currentCharacter.LeftHand1, lh2: $currentCharacter.LeftHand2, lh3: $currentCharacter.LeftHand3, weaponList: myWeaponList)
                ArmourView(head: $currentCharacter.Head, torso: $currentCharacter.Body, arms: $currentCharacter.Arms, legs: $currentCharacter.Legs, myHelmList: myHelmList, myBodyList: myBodyList, myArmsList: myArmsList, myLegsList: myLegsList)
                Section
                {
                    Button(action: {
                        print($currentCharacter)
                        
                    }, label: {
                        Text("View Requirements")
                        
                    })
                }
            }
            .navigationBarTitle(Text(currentCharacter.Name))
        }
    }
}


struct CharacterClassLevelView: View
{
    @Binding var charClass: Character.CharacterClass
    @Binding var level: Int
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Class:")
                        .bold()
                    Text("Level:")
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading)
                {
                    Text(charClass.rawValue)
                    Text(String(level))
                }
            }
        }
    }
}

struct SingleCharacterView_Previews: PreviewProvider {
    
    var myWeaponlist = WeaponList.init().allWeapons
    
    static var previews: some View {
        //SingleCharacterView(name: "Dave")
        //WeaponPickerList(label: "Test EWapons picker", weapon: .constant(Weapon(name: "None", description: "None", location: "None", weight: 0.0, durability: 0, imageKey: "wpn_none", physAtk: 0, magAtk: 0, fireAtk: 0, lightningAtk: 0, darkAtk: 0, critical: 0, physDef: 0, magDef: 0, fireDef: 0, lightningDef: 0, darkDef: 0, stability: 0, bleed: 0, poison: 0, frost: 0, dmgType: [], ability: Skill(name: "Parry", description: "Parrys the foes attack"), fpCost: 0, strReq: 0, strScale: Weapon.Scaling.None.rawValue, dexReq: 0, dexScale: Weapon.Scaling.None.rawValue, intReq: 0, intScale: Weapon.Scaling.None.rawValue, fthReq: 0, fthScale: Weapon.Scaling.None.rawValue, weaponType: "None")))
        SingleCharacterView(initCharacter: CharacterList.init().allCharacters.first!)
    }
}

struct RightHandView: View {
    @Binding var rh1: Weapon
    @Binding var rh2: Weapon
    @Binding var rh3: Weapon
    let weaponList: [Weapon]
    
    var body: some View {
        Section
        {
            WeaponPickerList(label: "Right Hand 1", weapon: $rh1, selectedWeapon: weaponList.firstIndex(of: rh1) ?? 0)
                .onChange(of: rh1, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Right Hand 2", weapon: $rh2, selectedWeapon: weaponList.firstIndex(of: rh2) ?? 0)
                .onChange(of: rh2, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Right Hand 3", weapon: $rh3, selectedWeapon: weaponList.firstIndex(of: rh3) ?? 0)
                .onChange(of: rh3, perform: {
                    value in
                    print(value)
                })
        }
    }
}

struct LeftHandView: View {
    @Binding var lh1: Weapon
    @Binding var lh2: Weapon
    @Binding var lh3: Weapon
    let weaponList: [Weapon]
    
    var body: some View {
        Section
        {
            WeaponPickerList(label: "Left Hand 1", weapon: $lh1, selectedWeapon: weaponList.firstIndex(of: lh1) ?? 0)
                .onChange(of: lh1, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Left Hand 2", weapon: $lh2, selectedWeapon: weaponList.firstIndex(of: lh2) ?? 0)
                .onChange(of: lh2, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Left Hand 3", weapon: $lh3, selectedWeapon: weaponList.firstIndex(of: lh3) ?? 0)
                .onChange(of: lh3, perform: {
                    value in
                    print(value)
                })
        }
    }
}

struct ArmourView: View {
    @Binding var head: Armour
    @Binding var torso: Armour
    @Binding var arms: Armour
    @Binding var legs: Armour
    var myHelmList: [Armour]// = ArmourList.init().allHelms
    var myBodyList: [Armour]// = ArmourList.init().allBodys
    var myArmsList: [Armour]// = ArmourList.init().allArms
    var myLegsList: [Armour]// = ArmourList.init().allLegs
    
    var body: some View {
        Section
        {
            ArmourPickerList(allArmour: myHelmList,Label: "Head", SelectedArmour: $head, ArmourNumber: myHelmList.firstIndex(of: head) ?? 0)
                .onChange(of: head, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myBodyList, Label: "Body", SelectedArmour: $torso, ArmourNumber: myBodyList.firstIndex(of: torso) ?? 0)
                .onChange(of: torso, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myArmsList, Label: "Arms", SelectedArmour: $arms, ArmourNumber: myArmsList.firstIndex(of: arms) ?? 0)
                .onChange(of: arms, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myLegsList, Label: "Legs", SelectedArmour: $legs, ArmourNumber: myLegsList.firstIndex(of: legs) ?? 0)
                .onChange(of: legs, perform: {
                    value in
                    print(value)
                })
        }
    }
}
