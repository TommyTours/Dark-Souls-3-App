//
//  CharacterList.swift
//  DS3
//
//  Created by Tom Clifford on 28/04/2021.
//

import SwiftUI

struct CharacterListView: View {
    
    @State private var isShowingNewCharacter = false
    @Binding var characterListInstance: CharacterList
    
    var body: some View {
        NavigationView {
            List {
                Section
                {
                    Text("Add New Character")
                        .font(.title2)
                }
                Section(header: Text("My Characters"))
                {
                    ForEach(characterListInstance.allCharacters, id: \.Name) { character in
                        NavigationLink(destination: SingleCharacterView(initCharacter: character)) {
                            CharacterNameClassRow(rowCharacter: character)
                        }
                    }
                }
            }
        }.navigationBarTitle ( Text("My Characters") )
    }
}

struct  CharacterNameClassRow: View
{
    var rowCharacter: Character
    
    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading)
            {
                Text(rowCharacter.Name)
                    .font(.headline)
                Text(rowCharacter.CharClass.rawValue)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}


struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView(characterListInstance: .constant(CharacterList.init()))
    }
}
