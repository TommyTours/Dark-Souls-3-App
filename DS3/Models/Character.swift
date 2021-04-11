//
//  Character.swift
//  DS3
//
//  Created by Tom Clifford on 10/04/2021.
//

import Foundation

struct Character: Codable
{
    let Name: String
    let Level: Int
    let Vigor: Int
    let Attunement: Int
    let Endurance: Int
    let Vitality: Int
    let Strength: Int
    let Dexterity: Int
    let Intelligence: Int
    let Faith: Int
    let Luck: Int
    let RightHand1: Weapon?
    let RightHand2: Weapon?
    let RightHand3: Weapon?
    let LeftHand1: Weapon?
    let LeftHand2: Weapon?
    let LeftHand3: Weapon?
    let Head: Armour?
    let Arms: Armour?
    let Body: Armour?
    let Legs: Armour?
}
