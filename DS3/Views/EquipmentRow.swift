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
                Text(equipment.Name)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(equipment.ImageKey)
                    .resizable()
                    .frame(width: 45.0, height: 45.0)
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
    @State var showingDetails = false
    @Binding var selectedWeapon: Weapon?
    
    var body: some View
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
                        Button(action: { selectedWeapon = weapon
                        }, label: {
                            WeaponNameTypeRow(weapon: weapon)
                        })
                    }
                }
            }
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
                    EquipmentRow(
                        equipment: weapon
                    )
                    .navigationBarTitle("My Library")
                }
            }
        }
    }
    //MARK: - Previews
    struct EquipmentRow_Previews: PreviewProvider
    {
        static var previews: some View
        {
            let allWeapons = WeaponList.init().allWeapons
            let fumeUltra = allWeapons.first(where: { $0.Name == "Fume Ultra Greatsword" })
            var noneWeapon = allWeapons[0]
            
            
            //WeaponRows()
            //WeaponRows()
            //.preferredColorScheme(.dark)
            //WeaponRowsTextOnly(selectedWeapon: .constant(nil))
            WeaponPickerList(weapon: .constant(noneWeapon))
        }
    }
}

//MARK: - WeaponNameTypeRow
struct WeaponNameTypeRow: View
{
    let weapon: Weapon?
    
    var body: some View
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

//MARK: - WeaponPickerList
struct WeaponPickerList: View
{
    let allWeapons = WeaponList.init().allWeapons
    @State private var selectedWeapon = 0
    @Binding var weapon: Weapon

    
    var body: some View
    {
        NavigationView{
            Form
            {
//                Picker(selection: $selectedWeapon, label: Text(allWeapons[selectedWeapon].Name)) {
//                    ForEach(allWeapons) { weapon in
//                        WeaponNameTypeRow(weapon: weapon)
//                    }
//                }
                Picker("Weapon", selection: $selectedWeapon)
                {
                    ForEach(0...allWeapons.count-1, id: \.self)
                    {
                        weapon in
                        Text(allWeapons[weapon].Name)
                            //.tag(weapon.Name)
                    }
                }.onChange(of: selectedWeapon) {
                    value in
                    print(value)
                }
            }
        }
    }
}
