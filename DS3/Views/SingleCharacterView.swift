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
    @State var isDisplayingRequirements = false
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
    @State var equipLimit: Double
    @State var requiredWeight: Double
    @State var percentage: Double
    
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
        let basePlusVit: Double = 40.0 + Double(initCharacter.Attributes.Vitality)
        self.equipLimit = basePlusVit
        var totalEquipmentWeight: Double = 0.0
        let allEquips = [initCharacter.RightHand1, initCharacter.RightHand2, initCharacter.RightHand3, initCharacter.LeftHand1, initCharacter.LeftHand2, initCharacter.LeftHand3, initCharacter.Head, initCharacter.Body, initCharacter.Arms, initCharacter.Legs]
        allEquips.forEach { piece in
            totalEquipmentWeight += Double(piece.Weight)
        }
        self.requiredWeight = Double(totalEquipmentWeight)
        self.percentage = (totalEquipmentWeight/basePlusVit) * 100
    }
    
    func updateWeights()
    {
        let newEquipLimit = 40.0 + Double(currentCharacter.Attributes.Vitality)
        let newRequiredWeight = getTotalWeight()
        self.percentage = getPercentage(currentEquipped: newRequiredWeight, equipLimit: newEquipLimit)
        self.equipLimit = newEquipLimit
        self.requiredWeight = newRequiredWeight
    }
    
    func getPercentage(currentEquipped: Double, equipLimit: Double) -> Double
    {
        var percentage: Double
        percentage = currentEquipped / equipLimit
        percentage += 100
        return percentage
    }
    
    func getTotalWeight() -> Double
    {
        let total =  rh1.Weight + rh2.Weight + rh3.Weight + lh1.Weight + lh2.Weight + lh3.Weight + head.Weight + torso.Weight + arms.Weight + legs.Weight
        return Double(total)
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    CharacterClassLevelView(character: $currentCharacter, level: $level, equipLimit: $equipLimit, requiredWeight: $requiredWeight, percentage: $percentage)//rightHand1: $rh1, rightHand2: $rh2, rightHand3: $rh3, leftHand1: $lh1, leftHand2: $lh2, leftHand3: $lh3, head: $head, torso: $torso, arms: $arms, legs: $legs)
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
                        equipLimit = Double(currentCharacter.Attributes.Vitality) + 40.0
                        percentage = (requiredWeight/equipLimit) * 100
                        //updateWeights()
                    }
                }
                RightHandView(rh1: $currentCharacter.RightHand1, rh2: $currentCharacter.RightHand2, rh3: $currentCharacter.RightHand3, weaponList: myWeaponList, TotalWeight: $requiredWeight, Percentage: $percentage, CurrentLimit: equipLimit)
                LeftHandView(lh1: $currentCharacter.LeftHand1, lh2: $currentCharacter.LeftHand2, lh3: $currentCharacter.LeftHand3, weaponList: myWeaponList, TotalWeight: $requiredWeight, Percentage: $percentage, CurrentLimit: equipLimit)
                ArmourView(head: $currentCharacter.Head, torso: $currentCharacter.Body, arms: $currentCharacter.Arms, legs: $currentCharacter.Legs, myHelmList: myHelmList, myBodyList: myBodyList, myArmsList: myArmsList, myLegsList: myLegsList, TotalWeight: $requiredWeight, Percentage: $percentage, CurrentLimit: equipLimit)
                Section
                {
                    Button(action: {
                        isDisplayingRequirements.toggle()
                        print($currentCharacter)
                        
                    }, label: {
                        Text("View Requirements")
                        
                    })
                    .sheet(isPresented: $isDisplayingRequirements, content: {
                        RequirementsView(character: currentCharacter)
                    })
                }
            }
            .navigationBarTitle(Text(currentCharacter.Name))
        }
    }
}


struct CharacterClassLevelView: View
{
    @Binding var character: Character
    @Binding var level: Int
//    @Binding var rh1: Weapon
//    @Binding var rh2: Weapon
//    @Binding var rh3: Weapon
//    @Binding var lh1: Weapon
//    @Binding var lh2: Weapon
//    @Binding var lh3: Weapon
//    @Binding var Head: Armour
//    @Binding var Torso: Armour
//    @Binding var Arms: Armour
//    @Binding var Legs: Armour
    @Binding var EquipLimit: Double
    @Binding var RequiredWeight: Double
    @Binding var Percentage: Double
    let numFormatter: NumberFormatter
    
    init(character: Binding<Character>, level: Binding<Int>, equipLimit: Binding<Double>, requiredWeight: Binding<Double>, percentage: Binding<Double>)
    {
        self._character = character
                self._level = level
                numFormatter = NumberFormatter()
                numFormatter.maximumFractionDigits = 1
        self._EquipLimit = equipLimit
        self._RequiredWeight = requiredWeight
        self._Percentage = percentage
    }
    
//    init(character: Binding<Character>, level: Binding<Int>, rightHand1: Binding<Weapon>, rightHand2: Binding<Weapon>, rightHand3: Binding<Weapon>, leftHand1: Binding<Weapon>, leftHand2: Binding<Weapon>, leftHand3: Binding<Weapon>, head: Binding<Armour>, torso: Binding<Armour>, arms: Binding<Armour>, legs: Binding<Armour>)
//    {
//        self._character = character
//        self._level = level
//        numFormatter = NumberFormatter()
//        numFormatter.maximumFractionDigits = 1
//        self._rh1 = rightHand1
//        self._rh2 = rightHand2
//        self._rh3 = rightHand3
//        self._lh1 = leftHand1
//        self._lh2 = leftHand2
//        self._lh3 = leftHand3
//        self._Head = head
//        self._Torso = torso
//        self._Arms = arms
//        self._Legs = legs
//    }
    
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
                    Text("Equip Load:")
                        .bold()
                    Text("Equip Classification")
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading)
                {
                    Text(character.CharClass.rawValue)
                    Text(String(level))
                    Text("\(numFormatter.string(for: (RequiredWeight))!)/\(numFormatter.string(for: (EquipLimit))!) : \(numFormatter.string(for: (Percentage))!)%")
                    if Percentage >= 100.0
                    {
                        Text("Overburdened")
                    }
                    else if Percentage >= 70.0
                    {
                        Text("Heavy")
                    }
                    else if Percentage >= 30.0
                    {
                        Text("Regular")
                    }
                    else
                    {
                        Text("Light")
                    }
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
    @Binding var TotalWeight: Double
    @Binding var Percentage: Double
    let CurrentLimit: Double
    
    var body: some View {
        Section
        {
            WeaponPickerList(label: "Right Hand 1", weapon: $rh1, selectedWeapon: weaponList.firstIndex(of: rh1) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: rh1, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Right Hand 2", weapon: $rh2, selectedWeapon: weaponList.firstIndex(of: rh2) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: rh2, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Right Hand 3", weapon: $rh3, selectedWeapon: weaponList.firstIndex(of: rh3) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
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
    @Binding var TotalWeight: Double
    @Binding var Percentage: Double
    let CurrentLimit: Double
    
    var body: some View {
        Section
        {
            WeaponPickerList(label: "Left Hand 1", weapon: $lh1, selectedWeapon: weaponList.firstIndex(of: lh1) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: lh1, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Left Hand 2", weapon: $lh2, selectedWeapon: weaponList.firstIndex(of: lh2) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: lh2, perform: {
                    value in
                    print(value)
                })
            WeaponPickerList(label: "Left Hand 3", weapon: $lh3, selectedWeapon: weaponList.firstIndex(of: lh3) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
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
    @Binding var TotalWeight: Double
    @Binding var Percentage: Double
    let CurrentLimit: Double
    
    var body: some View {
        Section
        {
            ArmourPickerList(allArmour: myHelmList,Label: "Head", SelectedArmour: $head, ArmourNumber: myHelmList.firstIndex(of: head) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: head, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myBodyList, Label: "Body", SelectedArmour: $torso, ArmourNumber: myBodyList.firstIndex(of: torso) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: torso, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myArmsList, Label: "Arms", SelectedArmour: $arms, ArmourNumber: myArmsList.firstIndex(of: arms) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: arms, perform: {
                    value in
                    print(value)
                })
            ArmourPickerList(allArmour: myLegsList, Label: "Legs", SelectedArmour: $legs, ArmourNumber: myLegsList.firstIndex(of: legs) ?? 0, totalWeight: $TotalWeight, percentage: $Percentage, currentLimit: CurrentLimit)
                .onChange(of: legs, perform: {
                    value in
                    print(value)
                })
        }
    }
}
