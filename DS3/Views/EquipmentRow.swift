//
//  EquipmentRow.swift
//  DS3
//
//  Created by Tom Clifford on 06/04/2021.
//

import SwiftUI


//MARK: - EquipmentRow
struct EquipmentRow: View
{
    let equipment: Equipment
    @State var showingDetails = false
    var body: some View
    {
        Button {
            showingDetails = true
        } label: {
            HStack
            {
                Image(equipment.ImageKey)
                    .resizable()
                    .frame(width: 45.0, height: 45.0)
                Text(equipment.Name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding()
            .sheet(isPresented: $showingDetails) {
                WeaponDetailView(weapon: equipment as! Weapon)
            }
        }
    }
}

//MARK: - WeaponRowsTextOnly
struct WeaponRowsTextOnly: View
{
    @State var weaponList = WeaponList()
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(Weapon.WeaponTypes.allCases, id: \.rawValue)
                {
                    weaponType in
                    Section(header: Text(weaponType.rawValue))
                    {
                        ForEach(weaponList.allWeapons.filter
                        { $0.WeaponType == weaponType.rawValue })
                        {
                            weapon in
                            WeaponNameTypeRow(weapon: weapon)
                        }
                    }
                }
            }
            .navigationBarTitle("Weapons")
        }
    }
}

//MARK: - ArmourRowsTextOnly
struct ArmourRowsTextOnly: View
{
    @State var armourList = ArmourList()
    
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(Armour.ArmourPosition.allCases, id:\.rawValue)
                {
                    armourType in
                    Section(header: Text(armourType.rawValue))
                    {
                        ForEach(armourList.allArmours.filter { $0.Position == armourType.rawValue})
                        {
                            armour in
                            if armour.Name.uppercased() != "NONE"
                            {
                                ArmourNameTypeRow(armour: armour)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Armour")
        }
    }
}

//MARK: - WeaponRows
struct WeaponRows: View
{
    @State var weaponList = WeaponList()
    
    var body: some View
    {
        NavigationView {
            List(){
                ForEach(weaponList.allWeapons, id: \.Name) { weapon in
                    //                    EquipmentRow(
                    //                        equipment: weapon
                    //                    )
                    if weapon.Name.uppercased() != "NONE"
                    {
                        WeaponNameTypeRow(weapon: weapon)
                    }
                }
            }
            .navigationBarTitle("Weapons")
        }
    }
    
    //MARK: - Previews
    struct EquipmentRow_Previews: PreviewProvider
    {
        static var previews: some View
        {
            let allWeapons = WeaponList.init().allWeapons
            
            
            Group {
                ArmourRowsTextOnly()//selectedWeapon: .constant(allWeapons[1]))
                ArmourRowsTextOnly()//selectedWeapon: .constant(allWeapons[1]))
                    .previewDevice("iPhone SE (2nd generation)")
            }
            //WeaponRows()
            //.preferredColorScheme(.dark)
            //WeaponRowsTextOnly(selectedWeapon: .constant(nil))
            //WeaponPickerList(label: "Test Label", weapon: .constant(noneWeapon))
        }
    }
}

//MARK: - WeaponNameTypeRow
struct WeaponNameTypeRow: View
{
    let weapon: Weapon?
    
    var body: some View
    {
        NavigationLink(
            destination: WeaponDetailView(weapon: weapon!))
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text(weapon?.Name ?? "None")
                        .font(.headline)
                    Text(weapon?.WeaponType ?? "")
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

//MARK: - ArmourNameTypeRow
struct ArmourNameTypeRow: View
{
    let armour: Armour
    
    var body: some View
    {
        NavigationLink(destination: ArmourDetailView(armour: armour))
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text(armour.Name)
                        .font(.headline)
                    Text(armour.Position)
                        .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

//MARK: - WeaponPickerList
/// Provides a picker allowing a choice of all weapons.
/// Will look different depending on what it is embedded in, eg. NavigationView or Form
struct WeaponPickerList: View
{
    let allWeapons = WeaponList.init().allWeapons
    let label: String
    @Binding var weapon: Weapon
    @State var selectedWeapon: Int
    @Binding var totalWeight: Double
    @Binding var percentage: Double
    let currentLimit: Double
    
    
    var body: some View
    {
        Picker(label, selection: $selectedWeapon)
        {
            ForEach(0...allWeapons.count-1, id: \.self)
            {
                weapon in
                Text(allWeapons[weapon].Name)
                //.tag(weapon.Name)
            }
        }
        .onChange(of: selectedWeapon) {
            value in
            totalWeight -= Double(weapon.Weight)
            weapon = allWeapons[value]
            totalWeight += Double(weapon.Weight)
            percentage = (totalWeight/currentLimit) * 100
            print(value)
        }
    }
}

//MARK: - ArmourPickerList
/// Provides a picker allowing a choice of all amour.
/// Will look different depending on what it is embedded in, eg. NavigationView or Form
struct ArmourPickerList: View
{
    var allArmour: [Armour]
    var Label: String = "Armour"
    @Binding var SelectedArmour: Armour
    @State var ArmourNumber: Int
    @Binding var totalWeight: Double
    @Binding var percentage: Double
    let currentLimit: Double
    
    var body: some View
    {
        Picker(Label, selection: $ArmourNumber)
        {
            ForEach(0...allArmour.count-1, id: \.self)
            {
                weapon in
                Text(allArmour[weapon].Name)
                //.tag(weapon.Name)
            }
        }
        .onChange(of: ArmourNumber) {
            value in
            totalWeight -= Double(SelectedArmour.Weight)
            SelectedArmour = allArmour[value]
            totalWeight += Double(SelectedArmour.Weight)
            percentage = (totalWeight/currentLimit) * 100
            print(value)
        }
    }
}
