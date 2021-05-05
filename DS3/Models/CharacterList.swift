//
//  CharacterList.swift
//  DS3
//
//  Created by Tom Clifford on 28/04/2021.
//

import Foundation

struct CharacterList
{
    var allCharacters: [Character] { charactersCache }
    
    /// An in memory cache of weapons  that are persistently stored
    private var charactersCache: [Character] = [
    ]

    mutating func addCharacter(newCharacter: Character)
    {
        charactersCache.insert(newCharacter, at: charactersCache.count)
    }
}
