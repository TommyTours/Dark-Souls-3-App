////
////  ContentView.swift
////  DS3
////
////  Created by Tom Clifford on 05/04/2021.
////

import SwiftUI

struct ContentView: View {
    //let weapon : Weapon
    //let character: Character
    @State var myCharacterList = CharacterList.init()
    let myWeaponList = WeaponList.init()
    let myArmourList = ArmourList.init()
    var body: some View {
        TabView {
            CharacterMasterView(myCharacterList: $myCharacterList)
                .tabItem {
                    Image(systemName: "person")
                    Text("Character")
                }
            BrowseWeaponsView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Weapons")
                }
            BrowseArmourView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Armour")
                }
        }
    }
        //            .onAppear {
        //                //character.encode()
        //            }
        //            .onAppear {
        //                let decoder = JSONDecoder()
        //
        //                do {
        //                    let subDir = Bundle.main.resourceURL!.appendingPathComponent("Resources").path
        //                    let subDirURL = URL(fileURLWithPath: subDir)
        //                    let JSONURL = URL(fileURLWithPath: "CharacterEncoded",
        //                                    relativeTo: subDirURL).appendingPathExtension("json")
        //                    let characterData = try Data(contentsOf: JSONURL)
        //                    let characterDecoded = try decoder.decode(Character.self, from: characterData)
        //                    print(characterDecoded)
        //                } catch let error {
        //                    print(error)
        //                }
        //            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()//weapon: Dagger, character: testChar)
        ContentView()//weapon: Dagger, character: testChar)
            .preferredColorScheme(.dark)
    }
}
