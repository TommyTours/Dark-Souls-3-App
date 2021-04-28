//
//  SingleCharacterView.swift
//  DS3
//
//  Created by Tom Clifford on 19/04/2021.
//

import SwiftUI

struct SingleCharacterView: View {
    
    var name = "Dave"
    var level = 1
    var charClass = Character.CharacterClass.Deprived
    var myWeaponlist = WeaponList.init().allWeapons
    @State var rh1: Weapon = WeaponList.init().allWeapons[0]
    @State var rh2: Weapon = WeaponList.init().allWeapons[0]
    @State var rh3: Weapon = WeaponList.init().allWeapons[0]
    @State var lh1: Weapon = WeaponList.init().allWeapons[0]
    @State var lh2: Weapon = WeaponList.init().allWeapons[0]
    @State var lh3: Weapon = WeaponList.init().allWeapons[0]
    
    init(name: String)
    {
        self.name = name
        self.myWeaponlist = WeaponList.init().allWeapons
        self.rh1  = myWeaponlist[0]
        self.rh2  = myWeaponlist[0]
        self.rh3  = myWeaponlist[0]
        self.lh1  = myWeaponlist[0]
        self.lh2  = myWeaponlist[0]
        self.lh3  = myWeaponlist[0]
    }
    
    var body: some View
    {
        NavigationView
        {
            Form
            {
                Section
                {
                    CharacterNameLevelView(name: name, charClass: charClass, level: level)
                }
                Section
                {
                    Picker("Weapon", selection: $rh1)
                    {
                        ForEach(myWeaponlist, id: \.Name)
                        {
                            weapon in
                            Text(weapon.Name)
                                //.tag(weapon.Name)
                        }

                    }.onChange(of: rh1, perform: {
                        value in
                        print(value)
                    })
                    Text("\(rh1.Name)")
                }
            }
            
        }
    }
}


struct CharacterNameLevelView: View
{
    let name: String
    let charClass: Character.CharacterClass
    let level: Int
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Name:")
                        .bold()
                    Text("Class:")
                        .bold()
                    Text("Level:")
                        .bold()
                }
                Spacer()
                VStack(alignment: .leading)
                {
                    Text(name)
                    Text(charClass.rawValue)
                    Text(String(level))
                }
            }
        }
    }
}

struct SingleCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        SingleCharacterView(name: "Dave")
    }
}
