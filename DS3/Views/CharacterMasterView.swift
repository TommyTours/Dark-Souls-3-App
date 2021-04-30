//
//  CharacterMasterView.swift
//  DS3
//
//  Created by Tom Clifford on 30/04/2021.
//

import SwiftUI

struct CharacterMasterView: View {
    @Binding var myCharacterList: CharacterList
    var body: some View {
        if myCharacterList.allCharacters.count != 0
        {
            SingleCharacterView(initCharacter: myCharacterList.allCharacters.first!)
        }
        else
        {
            CharacterCreationView(characterList: $myCharacterList)
        }    }
}
